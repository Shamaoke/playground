
class User < ApplicationRecord

  has_secure_password
  has_and_belongs_to_many :capabilities

  def capable?(action)
    self.capabilities.map { it.name.to_sym }.any? action
  end
end

