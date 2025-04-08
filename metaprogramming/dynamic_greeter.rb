class DynamicGreeter
  def initialize(names)
    names.each do |name|
      self.class.define_method("greet_#{name}") do
        "Привет, #{name}!"
      end
    end
  end
end

greeter = DynamicGreeter.new(["Анна", "Борис"])
puts greeter.greet_Анна
puts greeter.greet_Борис
