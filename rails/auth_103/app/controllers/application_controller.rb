
class ApplicationController < ActionController::Base

  before_action :current_user

  private
    def current_user
      # cookies[:user_id] \
      #   and Current.user = User.find_by_id(cookies[:user_id]) \
      #   or Current.user = User.new
      Current.user = (cookies[:user_id] and User.find_by_id(cookies[:user_id]) or User.new)
    end

    def user_policy
      Current.user
    end
end

