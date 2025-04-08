class FlexibleResponder
  def method_missing(method, *args, &block)
    if method.to_s.start_with?("say_")
      "Ты сказал: #{args.join(' ')}"
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    method.to_s.start_with?("say_") || super
  end
end

responder = FlexibleResponder.new
puts responder.say_hello("Привет", "мир!")
puts responder.say_goodbye("До", "свидания")
# puts responder.jump("высоко")
puts responder.respond_to?(:say_hello)
