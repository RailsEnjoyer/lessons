class Thermostat
  def initialize(value = 20)
    self.set_temperature(value)
  end

  def set_temperature(value)
    if value >= 10 && value <= 30
      @temperature = value
      'temperature is set!'
    else
      'wrong temperature (too high or low)'
    end
  end

  def get_temperature
    @temperature
  end

  def to_fahrenheit
    return nil unless @temperature
    @temperature * (9 / 5.0) + 32
  end
end

thermostat = Thermostat.new

puts thermostat.set_temperature(18)
puts "current temperature is celsious: #{thermostat.get_temperature}"
puts "current temperature in fahrenheit is: #{thermostat.to_fahrenheit}"

