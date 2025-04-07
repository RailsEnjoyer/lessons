class Task
  attr_accessor :title, :description, :completed

  def initialize(title, description)
    @title = title
    @description = description
    @completed = false
  end

  def to_s
    status = @completed ? "[X]" : "[ ]"
    "#{status} Task: #{@title}\nDescription: #{@description}"
  end  
end
