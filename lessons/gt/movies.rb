class Film
  def initialize(title, director)
    @title = title
    @director = director
  end

  def title 
    @title
  end

  def directors_name
    @director
  end
end

movies = []

puts 'Enter directors name'
director = STDIN.gets.chomp

3.times do
  puts 'Some good movie?'
  title = STDIN.gets.chomp
  
  movies << Film.new(title, director)
end

movie = movies.sample

puts "Today i recommend to watch movie: #{movie.title}\n\nDirector: #{movie.directors_name}"