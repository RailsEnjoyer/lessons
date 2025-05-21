@all_tasks = []
def add_task(task)
  @all_tasks << task
end  

class Task
  attr_accessor :title, :description, :status, :priority
  def initialize(title,description,status,priority)
    @title = title
    @description = description
    @status = status
    @priority = priority
  end

  def update_task(all_tasks, task, param, update)
    finded = all_tasks.find { |t| t.title == task.title }
    for e in all_tasks
      if finded ==  param
        param = update
      end
    end   
  end
end  

shop = Task.new('Магазин','Сходить в магазин','Не выполнено','Средний')
carwash = Task.new('Мойка','Помыть машину','Не выполнено','Низкий')
winhockey = Task.new('Хоккей', 'Надо победить у Цска','Не выполнено', 'Высокий')

add_task(shop)
add_task(carwash)
add_task(winhockey)

shop.update_task(@all_tasks, shop, shop.title , 'БЕДРОНЬКА')
carwash.update_task(@all_tasks, carwash, carwash.description, 'ПОМЫТЬ ГОЛЬФА')
winhockey.update_task(@all_tasks, winhockey, winhockey.status, 'Выполнено')

puts shop.title
 
