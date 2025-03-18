require 'digest'

puts "Which deocder do you want to use?\n\n1. MD5\n\n2. SHA256"

choice = STDIN.gets.chomp

if choice == '1'
  system('clear')

  puts 'Enter string which should be coded'
  input = STDIN.gets.chomp
  puts Digest::MD5.new.update(input)

  puts "Coded: #{input} - via MD5"
elsif choice == '2'
  system('clear')

  puts 'Enter string which should be coded'
  input = STDIN.gets.chomp
  puts Digest::SHA256.new.update(input)

  puts "Coded: #{input} - via SHA256"
else
  puts 'Wrong input'
end

