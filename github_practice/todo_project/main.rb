require_relative 'task_manager'

manager = TaskManager.new

task1 = Task.new("Buy groceries", "Milk, eggs, bread")
task2 = Task.new("Work on project", "Finish the Git exercise")

manager.add_task(task1)
manager.add_task(task2)

puts "\nAll Tasks:"
manager.list_tasks

puts "\nSearching for 'git':"
manager.search("git")

puts "\nDeleting task #1:"
manager.delete_task(1)

puts "\nAll tasks after deletion:"
manager.list_tasks

puts "\nMarking first task as completed:"
manager.complete_task(1)

puts "\nAll tasks after completion:"
manager.list_tasks

puts "\nMarking task #1 as important:"
manager.mark_important(1)

puts "\nAll tasks:"
manager.list_tasks
