class AddressJob < ActiveJob::Base
  queue_as :address

  def perform(ip)
    return if ip.blank? || ip.used?
    RestClient.proxy = "http://#{ip.address.chomp}"
    ip.update!(used: true)
    6.times do
      puts "当前代理：`#{RestClient.proxy.inspect}`"
      begin
        result = RestClient.get 'http://www.etimechina.com/index.php?a=tou&m=Show&id=215&aid=7'
        puts result.inspect
        if result == '1'
          puts "投票成功"
          puts '*' * 100
        else
          puts "投票失败"
          puts '*' * 100
          break
        end
      rescue => e
        puts e.inspect
        puts '*' * 100
        break
      end
    end
  end
end
