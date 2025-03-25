class Animal
  attr_reader :name, :age, :hunger_level, :health

  def initialize(name, age)
    @name = name
    @age = age
    @hunger_level = 0 
    @health = 100
  end

  def make_sound
    raise NotImplementedError, 'Method should be realised in child classes'
  end

  def move
    raise NotImplementedError, 'Method should be realised in child classes'
  end

  def feed
    if @hunger_level >= 20
      reduce_hunger
      "Animal feeded! (hunger level now is: #{@hunger_level})"
    else
      "This animal is not hungry yet! (hunger level is: #{@hunger_level})"
    end
  end

  private

  def increase_hunger
    @hunger_level += 20
  end

  def reduce_hunger
    @hunger_level -= 20
  end
end

class Lion < Animal
  def make_sound
    increase_hunger
    "Arrrrgh! (hunger level now is: #{@hunger_level})"
  end

  def move
    increase_hunger
    "The lion walks calmly and confidently (hunger level now is: #{@hunger_level})"
  end
end

class Elephant < Animal
  def make_sound
    increase_hunger
    "Stuuuuu! (hunger level now is: #{@hunger_level})"
  end

  def move
    increase_hunger
    "The elephant don't want to move, he is resting (hunger level now is: #{@hunger_level})"
  end
end

class Monkey < Animal
  def make_sound
    increase_hunger
    "ya-ya-a-a (hunger level now is: #{@hunger_level})"
  end

  def move
    increase_hunger
    "The monkey is jumping everywhere! (hunger level now is: #{@hunger_level})"
  end
end

class Zoo
  def initialize(all_animals)
    @all_animals = all_animals
  end

  def feed_animals
    @all_animals.map { |animal| animal.feed }
  end
end

lion = Lion.new('Alex', 8)
elephant = Elephant.new('Coco', 14)
monkey = Monkey.new('Pablo', 5)

all_animals = [lion, elephant, monkey]

zoo = Zoo.new(all_animals)

puts "This lion's name is #{lion.name}"
puts "He could do #{lion.make_sound}"
puts "And now #{lion.move}"
puts zoo.feed_animals

