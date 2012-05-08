class AwardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @awards = @user.awards
    @badges = @awards.group_by { |t| t.badge_id }

    @badges_not_owned = Badge.where("id not in (?)", @awards.collect {|i| i.badge_id})
  end
end
