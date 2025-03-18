class Person
  def initialize(name, surname, age)
    @name = name
    @surname = surname
    @age = age
  end

  def is_old?
    if @age > 60
      return true
    else
      return false
    end
  end

  def construct
    if is_old? 
      puts "#{@name} #{@surname}\nand he is #{@age} - old"
    else
      puts "#{@name}\nand he is #{@age} - young"
    end
  end
end

person1 = Person.new('Гаврила', 'Петрович', 25)
person2 = Person.new('Фёдор', 'Петрович', 61)
person3 = Person.new('Василий', 'Алибабаевич', 14)

puts "We have 3 persons here: "
person1.construct
person2.construct
person3.construct
