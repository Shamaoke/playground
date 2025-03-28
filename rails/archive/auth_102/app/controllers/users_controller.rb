
class UsersController < ApplicationController
  def index = ( @users = User.all )

  def new = ( @user = User.new )

  def create = User.new(user_params) { _1.save and redirect_to users_path }

  private
    def user_params =
      params
        .require(:user)
        .permit(:login, :password)
end

