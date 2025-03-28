class Enemy
  def attack
    raise NotImplementedError, 'Method should be realised in child classes'
  end
end

class Goblin < Enemy
  attr_reader :damage

  def initialize(damage)
    @damage = damage
  end

  def attack
    "Goblin is attacking with a knife! And dealing #{@damage} damage!"
  end
end

class Orc < Enemy
  attr_reader :damage

  def initialize(damage)
    @damage = damage
  end

  def attack
    "Orc is attacking with a club! And dealing #{@damage} damage!"
  end
end

class Dragon < Enemy
  attr_reader :damage

  def initialize(damage)
    @damage = damage
  end

  def attack
    "Dragon is attacking with a fire! And dealing #{@damage} damage!"
  end
end

class Boss < Enemy
  def initialize(damage1, damage2, damage3)
    @damage1 = damage1
    @damage2 = damage2
    @damage3 = damage3
  end

  def attack
    "Boss is attacking with a knife, club and fire! And dealing #{@damage1 + @damage2 + @damage3} damage!"
  end
end

class Battle
  def start(array_of_enemies)
    array_of_enemies.each do |enemy|
      puts enemy.attack
    end
  end
end

goblin = Goblin.new(4)
orc = Orc.new(12)
dragon = Dragon.new(30)
boss = Boss.new(goblin.damage, orc.damage, dragon.damage)

array_of_enemies = [goblin, orc, dragon, boss]

battle = Battle.new
battle.start(array_of_enemies)
