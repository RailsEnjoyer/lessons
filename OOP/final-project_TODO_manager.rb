require 'date'

module Logger
  def timestamps(action)
    "_________________________________________________________________________
    #{action}: [#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}]\n\n
    "
  end
end

module Notification
  def notify(task)
    "Attention! Your task '#{task.title}' has not recieved an updates for a long time, you still interested in completion?"
  end
end

module Validation
  def valid_date?(str)
    begin 
      Date.parse(str)
      true
    rescue ArgumentError
      false
    end
  end
end

class Task
  attr_accessor :status, :priority, :title, :description
  include Logger
  extend Notification

  def initialize(title, description, status = "In progress", priority)
    @title = title
    @description = description
    @status = status
    @created = timestamps("Created")
    @priority = priority
  end

  def show
    "
    #{@created}Task: #{@title}. You need to #{@description}, it has #{@priority} priority.\n
    #{@status}
    _________________________________________________________________________
    "
  end
end

class TodoManager
  attr_reader :added_at, :deleted_at
  include Logger

  def initialize
    @all_tasks = []
  end

  def add_task(task)
    @all_tasks << task
    @added_at = timestamps("Added")
  end

  def delete_task(task)
    @all_tasks = @all_tasks.reject { |t| t.title == task.title}
    @deleted_at = timestamps("Deleted")
  end

  def update_task(task, attribute, new_value)
    found = @all_tasks.find { |t| t.title == task.title }
    if found && [:title, :description, :status, :priority].include?(attribute)
      found.send("#{attribute}=", new_value)
      timestamps("Updated")
    end
  end  

  def mark_as_completed(task)
    task.status = "Completed"
  end

  def show
    @all_tasks.map{ |t| "Task: #{t.title}" }
  end
end

class WorkTask < Task
  extend Notification
  include Validation

  def initialize(title, description, status = "In progress", priority, project_info, deadline)
    super(title, description, status, priority)

    @project_info = project_info

    validate_deadline(deadline)
  end

  def show
    "
    #{@created}Work Task: #{@title}. #{@project_info}. You need to #{@description}, it has #{@priority} priority. Valid till: #{@deadline}\n
    #{@status}
    _________________________________________________________________________
    "
  end

  private

  def validate_deadline(deadline)
    if valid_date?(deadline)
      @deadline = Date.parse(deadline)
    else
      abort "Wrong date, use (DD.MM.YYYY): #{deadline}"
    end
  end
end

class PersonalTask < Task
  extend Notification

  def show
    "
    #{@created}Hey hey, it's a personal Task: #{@title}! You need to #{@description}, it has #{@priority} priority. Hurry up and complete it asap!\n
    #{@status}
    _________________________________________________________________________
    "
  end
end

class RecurringTask < Task
  attr_accessor :interval
  include Logger
  extend Notification

  def initialize(title, description, status = "In progress", priority, interval)
    super(title, description, status, priority)
    @interval = interval
  end

  def show_next_date
    "Next repeat date is: #{next_date}"
  end

  def show
    "
    #{@created}Task: #{@title}. You need to #{@description}, it has #{@priority} priority. This task repeats every #{@interval} days\n
    #{@status}
    _________________________________________________________________________
    "
  end

  private 

  def next_date
    Date.today + @interval
  end
end

chilling = Task.new("Chilling", "Just chill a bit", "High")
codding = WorkTask.new("Codding", "Do some exercises", "High", "Create a to do console manager", "20.04.2025")
dog_walk = PersonalTask.new("Play with dog", "Walk with dog outside", "Medium")
wash_car = RecurringTask.new("Clean a car", "I need to wash and clean my car more regularry", "Low", 35)

manager = TodoManager.new

manager.add_task(codding)
manager.add_task(chilling)
manager.add_task(dog_walk)
manager.add_task(wash_car)

puts manager.show
puts manager.added_at

puts manager.delete_task(chilling)
puts manager.show

manager.update_task(codding, codding.title, "Do more exercises")

puts codding.title

puts codding.show

puts manager.show

puts dog_walk.show

puts codding.show

puts wash_car.interval
puts wash_car.show_next_date

puts Task.notify(chilling)
puts PersonalTask.notify(dog_walk)
puts codding.status

manager.mark_as_completed(codding)

puts codding.status