
class UserPolicy < ApplicationPolicy

  def index?
    user.login.eql? 'nikolai'
  end

  def show?
    user.login.eql? 'nikolai'
  end
end

