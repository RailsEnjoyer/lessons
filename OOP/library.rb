# Модуль для обработки ошибок.
# В методе safe_execute мы оборачиваем выполнение блока в begin-rescue,
# чтобы перехватывать и выводить сообщения об ошибках.
module ErrorHandling
  def safe_execute
    begin
      yield
    rescue StandardError => e
      puts "Ошибка: #{e.message}"
    end
  end
end

# Класс Catalogue отвечает за хранение и управление книгами в библиотеке.
class Catalogue
  include ErrorHandling  # Подключаем модуль для обработки ошибок

  attr_reader :catalogue_name, :books

  def initialize(params)
    @catalogue_name = params[:catalogue_name]
    @books = []
  end

  # Добавление книги в каталог
  def add_book(book)
    @books << book
    puts "Книга '#{book.title}' добавлена в каталог."
  end

  # Удаление книги из каталога
  def remove_book(book)
    if @books.delete(book)
      puts "Книга '#{book.title}' удалена из каталога."
    else
      puts "Книга '#{book.title}' не найдена в каталоге."
    end
  end

  # Метод для выдачи книги по названию.
  # Если книга доступна, помечаем её как недоступную и возвращаем объект книги.
  # Если нет – генерируем исключение, которое обрабатывается в safe_execute.
  def borrow_book(book_title)
    safe_execute do
      book = @books.find { |b| b.title == book_title && b.available }
      if book
        book.available = false
        puts "Вы успешно взяли книгу: #{book.title}"
        return book
      else
        raise "Книга '#{book_title}' недоступна для взятия."
      end
    end
  end

  # Метод для возврата книги.
  # Если книга найдена и находится в состоянии «на руках», делаем её доступной.
  def return_book(book_title)
    safe_execute do
      book = @books.find { |b| b.title == book_title && !b.available }
      if book
        book.available = true
        puts "Книга '#{book.title}' возвращена."
      else
        raise "Книга '#{book_title}' не найдена или уже возвращена."
      end
    end
  end

  # Поиск книг по названию (без учёта регистра)
  def find_by_title(title)
    results = @books.select { |book| book.title.downcase.include?(title.downcase) }
    if results.empty?
      puts "Нет книг с заголовком, содержащим '#{title}'."
    else
      results.each { |book| puts book.full_info }
    end
  end

  # Поиск книг по автору
  def find_by_author(author)
    results = @books.select { |book| book.author.downcase.include?(author.downcase) }
    if results.empty?
      puts "Нет книг, автором которых является '#{author}'."
    else
      results.each { |book| puts book.full_info }
    end
  end

  # Поиск книг по жанру
  def find_by_genre(genre)
    results = @books.select { |book| book.genre.downcase.include?(genre.downcase) }
    if results.empty?
      puts "Нет книг жанра '#{genre}'."
    else
      results.each { |book| puts book.full_info }
    end
  end
end

# Класс Book описывает книгу с атрибутами и методами для получения информации.
class Book
  attr_reader :title, :genre, :author
  attr_accessor :available

  def initialize(params)
    @title     = params[:title]
    @genre     = params[:genre]
    @author    = params[:author]
    @available = params.fetch(:available, true)
  end

  # Метод, возвращающий полную информацию о книге.
  def full_info
    "Книга: #{@title}, Жанр: #{@genre}, Автор: #{author}, Статус: #{is_available?}"
  end

  # Метод для определения доступности книги.
  def is_available?
    @available ? 'Доступна для выдачи' : 'На руках'
  end
end

# Базовый класс User. В дальнейшем от него наследуются различные типы пользователей.
class User
  attr_reader :role, :name

  def initialize(role, name)
    @role = role
    @name = name
  end
end

# Класс Reader – наследник класса User.
# Он представляет читателя библиотеки и хранит список взятых книг.
class Reader < User
  include ErrorHandling  # Подключаем обработку ошибок

  attr_reader :borrowed_books

  def initialize(role, name)
    super(role, name)
    @borrowed_books = []
  end

  # Метод для взятия книги.
  # Вызывает метод borrow_book каталога, а затем сохраняет книгу в списке взятых.
  def take_book(catalogue, book_title)
    safe_execute do
      book = catalogue.borrow_book(book_title)
      if book
        @borrowed_books << book
        puts "Читатель #{name} взял книгу '#{book.title}'."
      end
    end
  end

  # Метод для возврата книги.
  # Если книга найдена среди взятых, вызывается метод возврата в каталоге.
  def return_book(catalogue, book_title)
    safe_execute do
      book = @borrowed_books.find { |b| b.title == book_title }
      if book
        catalogue.return_book(book_title)
        @borrowed_books.delete(book)
        puts "Читатель #{name} вернул книгу '#{book.title}'."
      else
        raise "У читателя #{name} нет книги с названием '#{book_title}'."
      end
    end
  end

  # Вывод всех взятых книг
  def all_taken_books
    if @borrowed_books.empty?
      puts "У #{name} нет взятых книг."
    else
      @borrowed_books.each { |b| puts b.full_info }
    end
  end
end

# --- Пример использования приложения ---

# Создаём каталог библиотеки
catalogue = Catalogue.new(catalogue_name: 'Библиотека')

# Создаём несколько книг
harry_potter = Book.new(title: 'Harry Potter', genre: 'Fantasy', author: 'J.K. Rowling', available: true)
deadpool     = Book.new(title: 'Deadpool',     genre: 'Fantasy', author: 'Robert Kirkman', available: true)
time         = Book.new(title: 'Time',         genre: 'Thriller', author: 'Chelokos', available: true)

# Добавляем книги в каталог
catalogue.add_book(harry_potter)
catalogue.add_book(deadpool)
catalogue.add_book(time)

# Создаём читателя
reader = Reader.new('reader', 'Иван')

# Читатель пытается взять книгу "Harry Potter"
reader.take_book(catalogue, 'Harry Potter')

# Проверяем информацию о книге после выдачи
puts harry_potter.full_info

# Попытка взять ту же книгу снова (будет обработана ошибкой)
reader.take_book(catalogue, 'Harry Potter')

# Выводим список книг, взятых читателем
reader.all_taken_books

# Читатель возвращает книгу "Harry Potter"
reader.return_book(catalogue, 'Harry Potter')

# Список книг у читателя после возврата
reader.all_taken_books

# Проверяем статус книги после возврата
puts harry_potter.full_info
