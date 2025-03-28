
class SessionsController < ApplicationController

  def new
  end

  def create
    User.authenticate_by(login: params[:login], password: params[:password]).then do
      if it
        cookies[:user_id] = { value: it.id }
        redirect_to contracts_path
      else
        redirect_to new_session_path
      end
    end
  end
end

