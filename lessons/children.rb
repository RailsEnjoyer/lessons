class Parent
  attr_accessor :name, :surname
  
  def initialize(name, surname)
    @name = name
    @surname = surname
  end

  def is_obident?
    true
  end
end

class Children < Parent
  def is_obident?
    false
  end
end

parent = Parent.new('Karol', 'Borek')
childern1 = Children.new('Alicja', 'Borek')
childern2 = Children.new('Ada', 'Borek')

puts "#{parent.name} #{parent.surname} obident?: #{parent.is_obident?}"
puts "#{childern1.name} obident?: #{childern1.is_obident?}"
puts "#{childern2.name} obident?: #{childern2.is_obident?}"