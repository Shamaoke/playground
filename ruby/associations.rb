class Author
  def initialize name
    @name = name
  end

  def get_name
    @name
  end
end

class Book
  belongs_to :author # this call creates additional methods to get to the association, e. g. @book.author

  def initialize name, author
    @name   = name
    @author = author
  end

  # or without helper
  def get_name
    @name
  end

  def author
    @author
  end
end

genry = Author.new 'Genry'

fairy_tail = Book.new 'Fairy Tail', genry

fairy_tail.author.get_name #=> 'Genry'

# we can't get access to an author through books (@author.books), since the link
# between the associations is unidirectional book → author

# vim: set textwidth=80 colorcolumn=80:
