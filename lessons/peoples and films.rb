class Person
  def initialize(name, surname, age)
    @name = name
    @surname = surname
    @age = age
  end

  def name
    @name
  end

  def full_name
    "#{@name} #{@surname}"
  end

  def age
    @age
  end

  def film=(film)
    @film = film
  end

  def film
    @film
  end
end

class Movie 
  def initialize(title, director)
    @title = title
    @director = director
  end

  def title
    @title
  end

  def director
    @director
  end
end

person1 = Person.new('Sergey', 'Vitalievich', 43)
person2 = Person.new('Marina', 'Enn', 28)
person3 = Person.new('Madonna', 'Elisa', 58)

person1.film = Movie.new('Jaws', 'Spilberg')
person2.film = Movie.new('Shindlers list', 'Spilberg')
person3.film = Movie.new('Jurrasic park', 'Spilberg')

puts "#{person1.name}\nwith favorite movie: #{person1.film.title}\n\n"
puts "#{person2.name}\nwith favorite movie: #{person2.film.title}\n\n"
puts "#{person3.name}\nwith favorite movie: #{person3.film.title}\n\n"