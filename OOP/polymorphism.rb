class Bird
  def sound
    "Чирик-чирик"
  end
end

class Airplane
  def sound
    "Вжух"
  end
end

def play_sound(entity)
  puts entity.sound
end

bird = Bird.new
airplane = Airplane.new

play_sound(bird)
play_sound(airplane)
