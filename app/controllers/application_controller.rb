class ApplicationController < ActionController::Base
  include LoginConcern
  protect_from_forgery
end
