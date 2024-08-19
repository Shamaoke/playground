require 'forwardable'

class People < Array
  extend Forwardable

  def_delegator :@people, :push, :add

  def initialize
    @people = [ ]
  end
end

