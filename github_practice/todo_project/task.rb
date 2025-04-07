class Task
  attr_accessor :title, :description, :completed, :important

  def initialize(title, description)
    @title = title
    @description = description
    @completed = false
    @important = false
  end

  def to_s
    status = @completed ? "[X]" : "[ ]"
    important_mark = @important ? "⭐" : ""
    "#{important_mark} #{status} Task: #{@title}\nDescription: #{@description}"
  end  
end
