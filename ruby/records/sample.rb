
class Measure < Data.define(:amount, :unit)
  include Comparable

  def <=> other
    return unless other.is_a?(self.class) and other.unit.eql?(self.unit)

    amount <=> other.amount
  end
end

class << Measure

end

