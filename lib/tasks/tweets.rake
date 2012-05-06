
desc "Load tweets"
task :cron => :environment do
	require 'Tweets'

	Tweets.check_tweets
end