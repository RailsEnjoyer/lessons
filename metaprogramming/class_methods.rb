class Library
  @@book_count = 0

  def initialize(title)
    @title = title
    @@book_count += 1
  end

  def details
    "Книга: #{@title}"
  end

  def self.total_books
    @@book_count
  end
end

book1 = Library.new("Ruby для начинающих")
book2 = Library.new("Метапрограммирование на Ruby")
puts Library.total_books
