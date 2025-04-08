class Calculator
  def initialize(operations)
    operations.each do |op|
      self.class.define_method(op) do |a, b|
        case op
        when :add
          a + b
        when :subtract
          a - b
        when :multiply
          a * b
        when :divide
          a / b
        else
          "Операция не поддерживается"
        end
      end
    end
  end
end

calc = Calculator.new([:add, :subtract, :multiply, :divide])
puts calc.add(10, 5)
puts calc.subtract(10, 5)
