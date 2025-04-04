module Logging
  def log(message)
    puts "[LOG #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] #{message}"
  end
end

class User
  include Logging
  
  def initialize(name)
    @name = name
    log("Пользователь #{@name} создан")
  end

  def change_name(new_name)
    log("Пользователь #{@name} меняет имя на #{new_name}")
    @name = new_name
  end
end

class Order
  include Logging
  
  def initialize(order_id)
    @order_id = order_id
    log("Заказ с ID #{@order_id} создан")
  end

  def cancel
    log("Заказ с ID #{@order_id} отменён")
  end
end

user = User.new("Иван")
user.change_name("Алексей")

order = Order.new(12345)
order.cancel
