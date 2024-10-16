
class ApplicationController < ActionController::Base

  before_action :current_user

  private
    def current_user
      cookies[:user_id] and Current.user = User.find_by_id(cookies[:user_id])
    end
end

