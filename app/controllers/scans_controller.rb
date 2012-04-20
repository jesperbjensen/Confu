class ScansController < ApplicationController
  def new

  	if current_user.nil?
  		redirect_to new_user_path({code: params[:code]})
  	end

  	@token = Token.find_by_code(params[:code])
  	@badge = @token.badge


  end
end
