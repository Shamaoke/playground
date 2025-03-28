
class UsersController < ApplicationController

  authorize :user, through: :user_policy

  def index
    @users = User.all.order(:surname)
  end

  def show
    # @user = User.find_by_id(params[:id]) or not_found!
    @user = User.find_by_id!(params[:id])
    begin
      # authorize! @user if @user
      authorize! @user
    rescue ActionPolicy::Unauthorized
      redirect_to users_path, alert: t('messages.unauthorized')
    end
  end

end

