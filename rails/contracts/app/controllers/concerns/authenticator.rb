
module Authenticator

  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private
    def authenticate
      Current.user = begin
        cookies[:user_id] and User.find_by_id(cookies[:user_id]) or User.new
      end
    end
end

