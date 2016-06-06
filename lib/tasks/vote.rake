namespace :vote do
  desc "投票"
  task lj: :environment do
    Ip.all.each do |ip|
      AddressJob.perform_later ip
    end
  end

  desc '定时任务'
  task dingshi: :environment do
    require 'sidekiq/api'
    address_queue = Sidekiq::Queue.new('address')
    Rake::Task['vote:lj'].invoke if address_queue.size == 0
  end
end
