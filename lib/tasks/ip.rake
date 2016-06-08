namespace :ip do
  desc "快代理"
  task kuaidaili: :environment do
    next if Ip.count > 500
    url = 'http://dev.kuaidaili.com/api/getproxy?orderid=916530213383118&num=234&dedup=1'
    response = RestClient.get(url)
    puts '*' * 120
    puts '「快代理」返回的数据：'
    puts response.inspect
    puts '*' * 120
    ips = response.split("\n")
    next if ips.blank?
    ips.each do |ip|
      Ip.find_or_create_by(address: ip)
    end
  end

  desc "代理666"
  task daili666: :environment do
    next if Ip.count > 500
    url = 'http://qsrdk.daili666api.com/ip?tid=557988298627683&num=235&filter=on'
    response = RestClient.get(url)
    puts '*' * 120
    puts '「代理666」返回的数据：'
    puts response.inspect
    puts '*' * 120
    ips = response.split("\r\n")
    next if ips.blank?
    ips.each do |ip|
      Ip.find_or_create_by(address: ip)
    end
  end
end
