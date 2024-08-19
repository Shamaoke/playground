class Person
  def initialize name, surname
    @name    = name
    @surname = surname
  end

  def get_name
    @name
  end

  def get_surname
    @surname
  end
end

class People
  include Enumerable

  def initialize *people
    @people = people
  end

  def each &block
    @people.each &block
    # @people.to_enum :each
  end
end
