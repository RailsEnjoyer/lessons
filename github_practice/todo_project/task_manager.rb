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
end
