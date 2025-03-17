require 'translit'

puts 'Enter something'
input = STDIN.gets.chomp

puts "Your transliteration: #{Translit.convert(input)}"