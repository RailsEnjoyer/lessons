kolbasa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

puts "we got: #{kolbasa}"

def shop(input, kolbasa)
    puts "here you go: #{kolbasa.slice(0..input-1).inspect}"
end

puts "how many do you want to cut of it?"
input = STDIN.gets.chomp.to_i

shop(input, kolbasa)