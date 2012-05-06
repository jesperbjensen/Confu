require "tweets_checker"

class TweetsController < ApplicationController
  def check
    TweetsChecker.check_tweets

    render text: "Done"
  end
end
