class Task
  attr_accessor :title, :description

  def initialize(title, description)
    @title = title
    @description = description
  end

  def to_s
    "Task: #{@title}\nDescription: #{@description}"
  end
end
