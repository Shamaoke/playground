
module Authentication
  extend ActiveSupport::Concern

  # included { before_action :authenticate }

  included {
    before_action { Current.data = "Текущее время #{Time.now}" }
  }

  # private
  #   def authenticate
  #     Current.data = "Текущее время #{Time.now}"
  #   end
end

