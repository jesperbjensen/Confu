class UsersController < ApplicationController
  before_filter :require_admin, only: [:index, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.calculate_points
  end

  def lolcat
    @user = User.find(params[:id])
  end

  def scoreboard
    @users = User.where("points > 0").order("points desc")
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    
    # We will first try to find a already existing user
    @user = User.find_by_email(params[:user][:email])

    # No user found, so we create a new one
    if @user.nil?
      @user = User.new(params[:user])
    end
    
    if @user.save
      set_current_user(@user.email)
        
      unless params[:code].blank?
        if params[:type] == "scans"
          redirect_to new_scan_path({code: params[:code]})
        elsif params[:type] == "shakes"
          redirect_to new_shake_path({code: params[:code]})
        else
          redirect_to @user, notice: 'User was successfully created.'
        end
      else
        redirect_to @user, notice: 'User was successfully created.'
      end
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

     @user.id

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_url
  end

  def recalculate
    User.all.each do |u|
      u.calculate_points
    end

    render text: "Done"
  end
end
