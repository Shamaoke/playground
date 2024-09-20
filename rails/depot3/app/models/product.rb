
class Product < ApplicationRecord

  validates :title, presence: true, uniqueness: true, format: { with: %r{.*} }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line items present')
        throw :abort
      end
    end
end

