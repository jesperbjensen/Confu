class StatsController < ApplicationController

  def index
    @awards_by_badge = ActiveRecord::Base.connection.execute("SELECT b.name ,COUNT(a.badge_id) as quantity from awards a INNER JOIN badges b on b.id = a.badge_id GROUP BY badge_id, b.name ORDER BY COUNT(a.badge_id)")

    @total_awards = Award.count
    @total_tweets = Tweet.where("user_id is not null").count
    @total_qr_shakes = Shake.all.count / 2
  end

end
