namespace :db do
  desc "清除数据库中所有表的原始数据"
  task clean: :environment do
    puts
    puts "```````````````````开始清理数据库```````````````````"
    Ip.where('failed_count >= 3 AND success_count = 0').destroy_all
    Ip.where('failed_count >= 6 AND success_count < failed_count').destroy_all
    puts "```````````````````完成清理数据库```````````````````"
  end
end
