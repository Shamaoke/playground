
require 'bacon'

RSpec.describe Bacon do

  it 'is edible' do
    # expect(Bacon.edible?).to be(true)
    # expect(Bacon).to be_edible

    # expect(Bacon.new.edible?).to(true)
    expect(subject.edible?).to be(true)
  end

  it 'can expire' do

    subject.expired!

    expect(subject).to_not be_edible
  end
end

