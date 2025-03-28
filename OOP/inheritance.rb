class Animal
  def initialize(name)
    @name = name
  end

  def speak
    raise NotImplementedError, 'Method should be realised in child classes'
  end
end

class Dog < Animal
  def speak
    "Гав-гав!"
  end
end

class Cat < Animal
  def speak
    "Мяу!"
  end
end

dog = Dog.new("Бобик")
cat = Cat.new("Мурка")
puts "#{dog.instance_variable_get(:@name)} говорит: #{dog.speak}"
puts "#{cat.instance_variable_get(:@name)} говорит: #{cat.speak}"
