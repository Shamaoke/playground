
class ApplicationController < ActionController::Base

  private
    def current_user
      User.all[0]
    end
end

