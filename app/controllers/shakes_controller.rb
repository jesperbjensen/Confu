class ShakesController < ApplicationController
  before_filter :require_profile, only: [:new]

  def new_request
    @code = current_user.shake_code
    @url = new_shake_url({code: @code})
  end

  def new
    @code = params[:code]

    user_id, email = @code.split('-')

    @source_user = User.find(user_id)

    unless email == @source_user.email
      raise "Not correct parameters"
    end

    if @source_user.id == current_user.id
      raise "Cannot scan yourself"
    end

    @shake1 = current_user.shakes.find_or_create_by_dest_user_id(@source_user.id)
    @shake2 = @source_user.shakes.find_or_create_by_dest_user_id(current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shake }
    end
  end

  def index
    @shakes = current_user.shakes
  end
end
