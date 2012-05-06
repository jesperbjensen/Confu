
desc "Load tweets"
task :cron => :environment do
  require "tweets_checker"

	TweetsChecker.check_tweets
end