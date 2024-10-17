
class UserPolicy < ApplicationPolicy
  def show?
    user.login.eql? 'nikolai'
  end
end

