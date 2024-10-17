
class ApplicationController < ActionController::Base

  before_action :current_user

  private
    def current_user
      Rails.logger.info('CURRENT USER IS CALLED')
      cookies[:user_id] \
        and Current.user = User.find_by_id(cookies[:user_id]) \
        or Current.user = User.new
    end

    def user_policy
      Rails.logger.info('USER POLICY IS CALLED')
      Current.user
    end
end

