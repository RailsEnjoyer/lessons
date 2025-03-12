require 'date'

class Task < Post 
  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts 'What oyu need to do?'
    @text = STDIN.gets.chomp

    puts 'Enter date and time in format: DD.MM.YYYY, for example - 28.05.2024'
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    deadline = "Deadline: #{@due_date}"
    
    return [deadline, @text, time_string]
  end
end