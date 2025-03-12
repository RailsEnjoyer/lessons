require_relative 'post'
require_relative 'link'
require_relative 'task'
require_relative 'memo'


puts 'Hello, im your notepad!'
puts 'What do you want to write?'

  # Статические методы:
  
  # Принадлежат классу, а не объектам класса.
  # Вызываются на уровне класса.
  # Используются для утилитарных функций, которые не зависят от состояния экземпляра.

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console
entry.save

puts "Saved!"

# Явный контракт: Родительский класс устанавливает чёткие требования для подклассов.
# Обнаружение ошибок на ранних стадиях: Если подкласс не реализует обязательный метод, ошибка возникает сразу, что облегчает отладку.
# Полиморфизм: Все подклассы имеют одинаковый интерфейс, что позволяет легко работать с объектами разных типов через общий интерфейс.