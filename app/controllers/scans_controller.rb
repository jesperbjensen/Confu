class ScansController < ApplicationController
  def new

  	if current_user.nil?
  		redirect_to new_user_path({code: params[:code]})
  		return
  	end

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
