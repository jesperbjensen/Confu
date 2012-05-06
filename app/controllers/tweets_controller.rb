require "Tweets"

class TweetsController < ApplicationController
  def check
    Tweets.check_tweets

    render text: "Done"
  end
end
