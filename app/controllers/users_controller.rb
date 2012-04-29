class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
end
