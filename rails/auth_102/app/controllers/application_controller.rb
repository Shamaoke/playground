
class ApplicationController < ActionController::Base

  def current_user = ( cookies[:user_id] and Current.user = User.find_by_id(cookies[:user_id]) )

end

