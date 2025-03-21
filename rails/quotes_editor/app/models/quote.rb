
class Quote < ApplicationRecord

  validates :name, presence: true

  # after_create_commit -> {
  #   ##
  #   ## [Module: Turbo::Broadcastable — Documentation for turbo-rails (2.0.13)](https://rubydoc.info/gems/turbo-rails/Turbo/Broadcastable#broadcast_append_to-instance_method)
  #   ##
  #   broadcast_append_to(
  #     'quotes',
  #     partial: 'quotes/quote',
  #     locals: { quote: self },
  #     target: 'quotes'
  #   )
  # }
end

