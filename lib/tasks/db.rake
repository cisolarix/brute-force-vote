namespace :db do
  desc "清除数据库中所有表的原始数据"
  task clean: :environment do
    puts
    puts "```````````````````开始清理数据库```````````````````"
    Ip.unavailable.destroy_all
    puts "```````````````````完成清理数据库```````````````````"
  end
end
