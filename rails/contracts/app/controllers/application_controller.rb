
class ApplicationController < ActionController::Base

  include Authenticator

  # before_action :current_user

  ##
  ## rescue_from ActionPolicy::Unauthorized do |e|
  ##   ## 401 Unauthorized
  ##   self.status = :unauthorized
  ##   self.response_body = '401 Unauthorized'
  ## end
  ##
  rescue_from ActionPolicy::Unauthorized, with: :unauthorized

  private
    def unauthorized
      ## render plain: '401 Unauthorized', status: 401
      render file: "#{Rails.public_path}/401.html", status: 401
      ##
      ## Details:
      ##
      ## • [ActionController::Rendering](https://api.rubyonrails.org/classes/ActionController/Rendering.html#method-i-render)
      ##
      ## • [Rails](https://api.rubyonrails.org/classes/Rails.html#method-c-public_path)
      ##
      ## • [Class: Pathname — Documentation for pathname (3.0.2)](https://rubydoc.info/stdlib/pathname/Pathname)
      ##
      ## • [Pathname](https://api.rubyonrails.org/classes/Pathname.html)
      ##
    end

    # def current_user
    #   Current.user = begin
    #     cookies[:user_id] and User.find_by_id(cookies[:user_id]) or User.new
    #   end
    # end

    def authorization_subject
      Current.user
    end

    ## def employee
    ##   Current.user
    ## end
end

