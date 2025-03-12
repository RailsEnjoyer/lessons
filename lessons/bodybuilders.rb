class Bodybuilder
  def initialize
    @biceps = 0
    @triceps = 0
    @delta = 0
  end

  def pump(muscle)
    case muscle 
    when 'biceps'
      return @biceps += 1
    when 'triceps'
      return @triceps += 1
    when 'delta'
      return @delta += 1
    end
  end

  def show
    "biceps: #{@biceps}\ntriceps: #{@triceps}\ndelta: #{@delta}\n\n"
  end
end

bodybuilder1 = Bodybuilder.new
bodybuilder2 = Bodybuilder.new
bodybuilder3 = Bodybuilder.new

5.times do 
  bodybuilder1.pump('delta')
  bodybuilder2.pump('biceps')
  bodybuilder3.pump('triceps')
end

2.times do 
  bodybuilder1.pump('biceps')
  bodybuilder2.pump('delta')
  bodybuilder3.pump('delta')
end

7.times do 
  bodybuilder1.pump('triceps')
  bodybuilder2.pump('triceps')
  bodybuilder3.pump('biceps')
end


puts "first bodybuilder:\n#{bodybuilder1.show}"

puts "second bodybuilder:\n#{bodybuilder2.show}"

puts "third bodybuilder:\n#{bodybuilder3.show}"