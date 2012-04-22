class ScansController < ApplicationController
  before_filter :require_profile

  def new
  	@token = Token.find_by_code(params[:code])
  	@badge = @token.badge

  	if @token.available_for(current_user)
  		@award = @badge.award_to(current_user)
    else
      if @token.number_of_times_left(current_user) > 0
        @time_until_unlock = @token.minutes_until_unlock(current_user)
      end
  	end
  end
end
