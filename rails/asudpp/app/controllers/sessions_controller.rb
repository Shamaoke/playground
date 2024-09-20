class SessionsController < ApplicationController
  def new
  end

  def create
    User.find_by(name: params[:name]).yield_self do |user|
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to contracts_path, notice: 'Вы успешно вошли в систему'
      else
        redirect_to login_path, alert: 'Введены неправильные данные'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: 'Вы вышли из системы'
  end
end
