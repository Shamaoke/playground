
module UuidGenerator
  extend ActiveSupport::Concern

  included {
    before_create { self.id = SecureRandom.uuid }
  }
end

