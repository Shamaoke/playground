
class UsersController < ApplicationController

  authorize :user, through: :user_policy

  def index
    @users = User.all
  end

  def show
    p "USERS_CONTROLLER PARAMS: #{params}"
    @user = User.find_by_id(params[:id])
    begin
      authorize! @user
    rescue ActionPolicy::Unauthorized
      redirect_to users_path, alert: t('messages.unauthorized')
    end
  end

end

