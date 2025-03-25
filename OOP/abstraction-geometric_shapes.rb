class Shape 
  def area
    raise NotImplementedError, 'Method should be realised in child classes'
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
  end

  def area
    Math::PI * @radius**2
  end

  def name
    'circle'
  end
end

class Rectanlge < Shape
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @width * @height
  end

  def name
    'rectangle'
  end
end

class Triangle < Shape
  def initialize(base, height)
    @base = base
    @height = height
  end

  def area
    0.5 * @base * @height
  end

  def name
    'triangle'
  end
end

circle_area = Circle.new(15)
puts "area of the circle: #{circle_area.area.round(2)}"

rectangle_area = Rectanlge.new(15, 5)
puts "area of the rectangle: #{rectangle_area.area.round(2)}"

triangle_area = Triangle.new(15, 5)

puts "area of the triangle: #{triangle_area.area.round(2)}"

def comparsion(shape1, shape2)
  if shape1.area > shape2.area
    puts "#{shape1.name} is bigger"
  elsif shape2.area > shape1.area
    puts "#{shape2.name} is bigger"
  else
    puts 'shapes are equals'
  end
end

comparsion(circle_area, rectangle_area)

error = Shape.new

begin 
  puts error.area
rescue NotImplementedError
  puts "Method should be realised in child classes"
end
