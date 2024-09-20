
class Contract < ApplicationRecord
  has_many :specifications, dependent: :destroy
end

