
module UuidId
  extend ActiveSupport::Concern

  included {
    # before_create { self.id = SecureRandom.uuid if self.id.blank? }
    before_create { self.id = SecureRandom.uuid }
  }

end

