module LoggerModule
    LOG_LEVELS = {
      info: "INFO",
      warn: "WARNING",
      error: "ERROR"
    }

    def log(level, message)
      level_str = LOG_LEVELS[level] || "UNKNOWN"
      puts "#{timestamp} [#{level_str}] #{message}"
    end

    def timestamp
      Time.now.strftime('%Y-%m-%d %H:%M:%S')
    end
end

class User
  attr_accessor :name, :id
  include LoggerModule

  def initialize(name, id)
    @name = name
    @id = id

    log(:info, "User created")
  end

  def update_name(name)
    @name = name
    log(:info, "User name updated")
  end
end

class Order
  include LoggerModule

  def initialize(title, products)
    @title = title
    @products = products
    log(:info, "Order created")
  end

  def cancel_order
    if @title
      @title = nil
      @products= nil
      log(:warn, "Order cancelled")
    else
      log(:error, "Order not exists")
    end
  end

  def products
    raise "products returned nil" if @products.nil?
    @products.map do |product|
      product.title
    end
  end

  def title
    raise "title returned nil" if @title.nil?
    @title
  end

  def is_exists?
     @title ? true : false
  end
end

class Product
  attr_accessor :title, :price
  include LoggerModule

  def initialize(title, price)
    @title = title
    @price = price

    log(:info, "Product created")
  end

  def change_price(price)
    @price = price
    log(:info, "Price updated")
  end

  def delete_product
    if @title
      @title = nil
      @price = nil
      log(:warn, "Product deleted")
    else
      log(:error, "Product not exists")
    end
  end
end

include LoggerModule

user = User.new('Ilya', 1)
puts user.name

user.update_name('Pavel')
puts user.name

pizza = Product.new('Pizza', 12.99)
soda = Product.new('Soda', 2.99)
sauce = Product.new('Sauce', 0.99)

basket = [pizza, soda, sauce]

order_for_Ilya = Order.new('Order for Ilya', basket)
puts order_for_Ilya.title
puts order_for_Ilya.products
puts order_for_Ilya.is_exists?

order_for_Ilya.cancel_order
puts order_for_Ilya.is_exists?

begin
  puts order_for_Ilya.title
rescue => e
  log(:error, e.message)
end
