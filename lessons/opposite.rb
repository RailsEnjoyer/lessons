puts "Enemy of which hero you want to know?"
enemy_list = ['Batman', 'Sherlok', 'Frodo', 'Mozard']
puts enemy_list.inspect

input = STDIN.gets.chomp.capitalize

case input
when 'Batman'
    puts 'Joker'
when 'Sherlok'
    puts 'Moriarti'
when 'Frodo'
    puts 'Sauron'
when 'Mozard'
    puts 'Salieri'
else
    puts 'Cant find this hero'
end