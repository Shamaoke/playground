class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :authorize
  helper_method :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Please, log in.'
      end
    end
end
