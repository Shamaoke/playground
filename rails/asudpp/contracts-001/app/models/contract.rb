
class Contract < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :content, presence: true
end

