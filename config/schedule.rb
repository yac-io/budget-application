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

ENV.each { |k, v| env(k, v) }
job_type :rake_custom, "cd :path && echo $PATH && echo #{ENV['PATH']} && PATH=/usr/local/bin:$PATH:#{ENV['PATH']} :environment_variable=:environment bundle exec rake :task --silent :output"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}


every 1.day do
  rake_custom 'recurring:daily'
end

every 1.week do
  rake_custom 'recurring:weekly'
end


every 1.month do
  rake_custom 'recurring:monthly'
end


every 1.year do
  rake_custom 'recurring:yearly'
end

every 1.minute do
  rake_custom 'recurring:minute'
end