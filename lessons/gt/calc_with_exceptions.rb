puts "Enter first value"
value1 = STDIN.gets.chomp.to_i

puts "Enter second value"
value2 = STDIN.gets.chomp.to_i

puts "Enter operation"
operation = STDIN.gets.chomp

case operation
when '+'
  puts value1 + value2
  puts "Ending."
when '-'
  puts value1 - value2
  puts "Ending."
when '*'
  puts value1 * value2
  puts "Ending."
when '/'
  begin
    puts value1 / value2
  rescue ZeroDivisionError
    puts "Divided by zero"
  ensure
    puts "Ending."
  end
else
  puts 'Invalid operator'
  puts "Ending."
end