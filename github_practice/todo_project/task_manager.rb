require_relative 'task'

class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(task)
    @tasks << task
  end

  def list_tasks
    @tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end

  def search(keyword)
    puts "\nSearch results for '#{keyword}':"
    results = @tasks.select do |task|
      task.title.downcase.include?(keyword.downcase) ||
      task.description.downcase.include?(keyword.downcase)
    end
  
    if results.empty?
      puts "No tasks found."
    else
      results.each { |task| puts task }
    end
  end 
  
  def delete_task(index)
    if index.between?(1, @tasks.length)
      deleted = @tasks.delete_at(index - 1)
      puts "Deleted: #{deleted.title}"
    else
      puts "Invalid task number"
    end
  end  

  def complete_task(index)
    if index.between?(1, @tasks.length)
      @tasks[index - 1].completed = true
      puts "Task marked as completed!"
    else
      puts "Invalid task number"
    end
  end  

  def mark_important(index)
    if index.between?(1, @tasks.length)
      @tasks[index - 1].important = true
      puts "Task marked as important!"
    else
      puts "Invalid task number"
    end
  end  
end
