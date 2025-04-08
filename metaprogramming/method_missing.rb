class SilentResponder
  def method_missing(method, *args, &block)
    "Ошибка: Метод #{method} не существует."
  end

  def respond_to_missing?(method, include_private = false)
    true
  end
end

responder = SilentResponder.new
puts responder.anything
puts responder.some_random_call 
