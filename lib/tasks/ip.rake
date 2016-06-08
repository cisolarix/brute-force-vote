namespace :ip do
  desc "快代理"
  task kuaidaili: :environment do
    return if Ip.count > 500
    url = 'http://dev.kuaidaili.com/api/getproxy?orderid=916530213383118&num=999'
    ips = RestClient.get(url).split("\n")
    return if ips.blank?
    ips.each do |ip|
      Ip.find_or_create_by(address: ip)
    end
  end
end
