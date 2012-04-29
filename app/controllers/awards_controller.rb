class AwardsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @awards = @user.awards
    @badges = @awards.group_by { |t| t.badge_id }
  end
end
