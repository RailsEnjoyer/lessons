class Product
  attr_accessor :price, :quantity, :title

  def initialize(params)
    @title = params[:title]
    @price = params[:price]
    @quantity = params[:quantity]
  end
end

class Book < Product
  attr_accessor :genre, :author

  def initialize(params)
    super(params)

    @genre = params[:genre]
    @author = params[:author]
  end

  def full_product
    "The Book #{@title}, from #{@author}, in genre of: #{@genre}, #{@price} USD$, (#{@quantity} left)"
  end
end

class Movie < Product
  attr_accessor :year, :director

  def initialize(params)
    super(params)

    @year = params[:year]
    @director = params[:director]
  end

  def full_product
    "The Movie #{@title}, #{@year}, director - #{@director}, #{@price} USD$, (#{@quantity} left)"
  end
end

class ProductCollection
  attr_accessor :store

  def initialize(store)
    @store = store
  end

  def sorting_by(key, direction = :asc)
    sorted = @store.sort_by { |product| product.send(key) }
    sorted.reverse! if direction == :desc
    sorted
  end
end

store = [
  idiot = Book.new(title: 'Idiot', author: 'Fedor Dostoevskiy', genre: 'Roman', price: 9.99, quantity: 14),
  leon = Movie.new(title: 'Leon', year: 1994, director: 'Luk Besson', price: 19.99, quantity: 11),
  durak = Movie.new(title: 'Durak', year: 2014, director: 'Yuri Bykow', price: 14.99, quantity: 6)
]

idiot.price = 7.99
leon.quantity = 7

collection = ProductCollection.new(store)

puts "Do you want to apply sorting?"
puts "1 - Yes, 2 - No"

input = STDIN.gets.chomp.to_i

if input == 1
  puts "Which kind of sort do you want to use?"
  puts "1 - By price incremention"
  puts "2 - By price decremention"
  puts "3 - By quantity left incremention"
  puts "4 - By quantity left decremention"
  puts "5 - By title incremention"
  puts "6 - By title decremention"

  input = STDIN.gets.chomp.to_i

  case input
  when 1
    collection.sorting_by(:price, :asc).each do |product|
      puts product.full_product
    end
  when 2
    collection.sorting_by(:price, :desc).each do |product|
      puts product.full_product
    end
  when 3
    collection.sorting_by(:quantity, :asc).each do |product|
      puts product.full_product
    end
  when 4
    collection.sorting_by(:quantity, :desc).each do |product|
      puts product.full_product
    end
  when 5
    collection.sorting_by(:title, :asc).each do |product|
      puts product.full_product
    end
  when 6
    collection.sorting_by(:title, :desc).each do |product|
      puts product.full_product
    end
  else
    puts "Wrong input"
  end
      
elsif input == 2
  store.each do |product|
    puts product.full_product
  end
else
  puts "Wrong input"
end
