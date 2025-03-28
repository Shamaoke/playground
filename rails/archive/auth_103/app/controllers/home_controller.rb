
class HomeController < ApplicationController

  authorize :user, through: :user_policy

  def index
    begin
      authorize! Current.user
      render :index
    rescue ActionPolicy::Unauthorized
      render :index2
    end
  end
end

