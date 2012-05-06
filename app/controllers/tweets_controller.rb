require "TweetsChecker"

class TweetsController < ApplicationController
  def check
    Tweets.check_tweets

    render text: "Done"
  end
end
