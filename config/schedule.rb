# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

env :PATH, ENV['PATH']

# 此处需填写真实的路径
set :output,
    error:    '/Users/dengyanming/Desktop/error.log',
    standard: '/Users/dengyanming/Desktop/standard.log'

set :environment, :development

job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!

set :job_template, "/bin/zsh -l -c ':job'"

every 1.minutes do
  rbenv_rake 'vote:dingshi'
end
