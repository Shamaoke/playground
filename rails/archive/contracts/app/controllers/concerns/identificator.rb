
module Identificator

  extend ActiveSupport::Concern

  included do
    before_action :identificate
  end

  private
    def identificate
      Current.user = begin
        cookies[:user_id] and User.find_by_id(cookies[:user_id]) or User.new
      end
    end
end

