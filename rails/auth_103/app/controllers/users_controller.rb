
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    begin
      authorize! @user
    rescue ActionPolicy::Unauthorized
      redirect_to users_path, alert: t('messages.unauthorized')
    end
  end

end

