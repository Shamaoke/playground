# method_source.rbi
module MethodSource
  def self.source_helper: (source_location: Array, method_name: String) -> String
end

# method_source.rbs
describe MethodSource do
  describe '.source_helper' do
    before do
      @method_source = mock(MethodSource)
    end

    specify '(that) competitors don\'t accept payments' do
      expect(@method_source.expression_at).to_have_been_called
    end
  end
end

# method_source.rb
module MethodSource
  def self.source_helper source_location, method_name = nil
    expression_at *source_location
  end
end
