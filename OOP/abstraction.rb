class Vehicle
  def initialize(make, model)
    @make = make    
    @model = model 
  end

  def start_engine
    raise NotImplementedError, "Метод start_engine должен быть реализован в подклассах"
  end
end

class Car < Vehicle
  def start_engine
    "Двигатель автомобиля #{@make} #{@model} запущен!"
  end
end

class Motorcycle < Vehicle
  def start_engine
    "Мотоцикл #{@make} #{@model} готов к поездке!"
  end
end

car = Car.new("Toyota", "Camry")
puts car.start_engine  

motorcycle = Motorcycle.new("Honda", "CBR")
puts motorcycle.start_engine 
