
module Authentication
  extend ActiveSupport::Concern

  included {
    before_action {
      cookies[:user_id] and Current.user = User.find_by_id(cookies[:user_id])
    }
  }
end

