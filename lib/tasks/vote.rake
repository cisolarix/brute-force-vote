namespace :vote do
  desc "投票"
  task lj: :environment do
    Ip.available.each do |ip|
      AddressJob.perform_later ip
    end
  end
end
