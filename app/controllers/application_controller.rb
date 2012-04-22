class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user_cookie 


  def current_user
  	email = get_user_cookie_value
  	if email.blank?
  		email = session[:email]
  	end

  	unless email.blank?
  		return User.find_by_email(email)
  	else
  		return nil
  	end
  end

  def set_current_user email
  	session[:email] = email
  	set_user_cookies_value email
  end

  private

  def get_user_cookie_value
  	unless cookies[:login].nil?
			return cookies[:login]
		end
		return nil
  end

  def set_user_cookies_value email
		cookies[:login] = { :value => email, :expires => 1.year.from_now }
  end

  private

  # if there is no cookie on the visitors browser, we will add it from our session
  def set_user_cookie
  	unless session[:email].nil?
  		if get_user_cookie_value.nil?
  			set_user_cookies_value session[:email]
  		end
  	end
  end
end
