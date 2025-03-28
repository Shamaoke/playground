
class UserPolicy < ApplicationPolicy

  def index?
    user.login.eql? 'arina'
  end

  def show?
    user.login.eql? 'arina'
  end
end

