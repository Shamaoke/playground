
module Authentication
  extend ActiveSupport::Concern

  included {
    before_action { Current.data = "Текущее время #{Time.now}" }
  }

  # or

  # included { before_action :authenticate }

  # private
  #   def authenticate
  #     Current.data = "Текущее время #{Time.now}"
  #   end
end

