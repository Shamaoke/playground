
module UuidGenerator

  extend ActiveSupport::Concern
  ##
  ## Details:
  ##
  ## [ActiveSupport::Concern](https://api.rubyonrails.org/classes/ActiveSupport/Concern.html)
  ##


  included do
    before_create { self.id = SecureRandom.uuid }
  end
end

