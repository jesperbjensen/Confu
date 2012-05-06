
desc "Load tweets"
task :cron => :environment do
  require 'TweetsChecker'
	Tweets.check_tweets
end