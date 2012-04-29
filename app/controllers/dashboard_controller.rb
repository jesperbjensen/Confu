class DashboardController < ApplicationController
  before_filter :require_profile

  def index
  	redirect_to user_path(current_user.id)
  end
end
