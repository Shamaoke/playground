
class Bacon

  attr_accessor :expired

  def edible? = not expired

  def expired!
    self.expired = true
  end
end

