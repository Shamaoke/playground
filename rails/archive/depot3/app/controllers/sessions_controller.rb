class SessionsController < ApplicationController

  skip_before_action :authorize

  def new
  end

  def create
    User.find_by(name: params[:name]).yield_self do |user|
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        session[:user_name] = user.name
        redirect_to admin_url, notice: 'You have successfully logged in.'
      else
        redirect_to login_url, alert: 'Invalid user/password combination.'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to login_url, notice: 'You have been logged out.'
  end
end
