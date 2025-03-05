
class ApplicationController < ActionController::Base

  before_action :current_user

  ## rescue_from ActionPolicy::Unauthorized do |e|
  ##   ## 401 Unauthorized
  ##   self.status = :unauthorized
  ##   self.response_body = '401 Unauthorized'
  ## end

  rescue_from ActionPolicy::Unauthorized, with: :unauthorized

  private
    def unauthorized
      render plain: '401 Unauthorized', status: 401
    end

    def current_user
      Current.user = begin
        cookies[:user_id] and User.find_by_id(cookies[:user_id]) or User.new
      end
    end

    def authorization_subject
      Current.user
    end

    ## def employee
    ##   Current.user
    ## end
end

