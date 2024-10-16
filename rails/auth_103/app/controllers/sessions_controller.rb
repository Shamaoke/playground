
class SessionsController < ApplicationController

  def create
    User.authenticate_by(login: params[:login], password: params[:password]).then do
      if _1
        cookies[:user_id] = { value: _1.id, expires: 1.day }
        redirect_to root_path, notice: t('login.success')
      else
        redirect_to sessions_new_path, notice: t('login.fail')
      end
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to sessions_new_path, notice: t('login.out')
  end
end

