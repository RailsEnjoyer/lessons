class Person
  def say_hello
    "Привет, я человек!"
  end
end

person = Person.new

def person.special_greeting
  "Особое приветствие для меня!"
end

puts person.say_hello
puts person.special_greeting

another_person = Person.new

begin
  puts another_person.special_greeting
rescue NoMethodError => e
  puts "another_person.special_greeting returned #{e}"
end
