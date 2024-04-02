# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
env :RAILS_LOG_TO_STDOUT, true
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}


every 1.day do
  rake 'recurring:daily'
end

every 1.week do
  rake 'recurring:weekly'
end


every 1.month do
  rake 'recurring:monthly'
end


every 1.year do
  rake 'recurring:yearly'
end

every 1.minute do
  rake 'recurring:minute'
end