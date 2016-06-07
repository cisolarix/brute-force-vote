namespace :vote do
  desc "投票"
  task lj: :environment do
    Ip.prioritized.each do |ip|
      AddressJob.perform_later ip
    end
  end

  desc '定时任务'
  task dingshi: :environment do
    Ip.where('failed_count >= 3 AND success_count = 0').destroy_all
    Ip.where('failed_count >= 6 AND success_count < failed_count').destroy_all
    require 'sidekiq/api'
    address_queue = Sidekiq::Queue.new('address')
    Rake::Task['vote:lj'].invoke if address_queue.size < 50
  end
end
