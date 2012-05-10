class TweetsChecker

	def self.check_tweets
		last_id = Tweet.maximum('twitter_id')
    options = {rpp:100}

    unless last_id.nil?
      options.merge!({since_id: last_id})
    end
    
    tweets = Twitter.search("#cdcph", options)
    
    tweets.each do |tweet|
      t = Tweet.new
      t.twitter_id = tweet.id
      t.text = tweet.text
      t.tweet_created_at = tweet.created_at
      t.from_user = tweet.from_user
      t.save 
    end

    # we need to attach unattached tweets to users
    Tweet.where("user_id is null").all.each do |t|
      u = User.first("lower(twitter_name) = lower(?)", t.from_user)
      if u.nil?
        u = User.first("lower(twitter_name) = lower(?)", "@" + t.from_user)
      end
      unless u.nil?
        t.user = u
        t.save
      end
    end
	end

end