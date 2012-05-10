class StatsController < ApplicationController

  def index
    @awards_by_badge = ActiveRecord::Base.connection.execute("SELECT b.name ,COUNT(a.badge_id) as quantity from awards a INNER JOIN badges b on b.id = a.badge_id GROUP BY badge_id, b.name ORDER BY COUNT(a.badge_id) desc")

    @total_awards = Award.count
    @total_tweets = Tweet.where("user_id is not null").count
    @total_qr_shakes = Shake.all.count / 2

    @toilet = ActiveRecord::Base.connection.execute("SELECT u.name as username, b.name, COUNT(a.badge_id) as quantity from awards a INNER JOIN badges b on b.id = a.badge_id INNER JOIN users u on u.id = a.user_id GROUP BY u.name, b.name, a.badge_id ORDER BY COUNT(a.badge_id) desc, b.name")
  
    @top_tweeters = ActiveRecord::Base.connection.execute("SELECT u.name, COUNT(t.id) as quantity from tweets t INNER JOIN users u on u.id = t.user_id GROUP BY t.id, u.name ORDER BY COUNT(t.id) desc")
  end

end
