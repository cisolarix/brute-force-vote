class AddressJob < ActiveJob::Base
  queue_as :address

  def perform(ip)
    return if ip.blank? || ip.address.blank?
    RestClient.proxy = "http://#{ip.address.chomp}"
    puts "当前代理：`#{RestClient.proxy.inspect}`"
    begin
      result = RestClient.get 'http://www.etimechina.com/index.php?a=tou&m=Show&id=215&aid=7'
      if result == '1'
        ip.increment :success_count
        ip.save
        puts "投票成功".colorize(:green)
        puts '*' * 100
      else
        puts "投票失败".colorize(:yellow)
        ip.increment :failed_count
        ip.save
        puts '*' * 100
      end
    rescue => e
      # puts e.inspect
      puts '有异常发生'.colorize(:red)
      ip.increment :failed_count
      ip.save
      puts '#' * 100
    end
  end
end
