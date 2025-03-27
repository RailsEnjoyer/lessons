class BankAccount
  attr_reader :balance

  def initialize(initial_balance)
    @balance = initial_balance
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      log_transaction("Пополнение", amount)
    else
      "Сумма должна быть положительной"
    end
  end

  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      log_transaction("Снятие", amount)
    else
      "Недостаточно средств или неверная сумма"
    end
  end

  private

  def log_transaction(type, amount)
    puts "#{type}: #{amount} руб."
  end
end

account = BankAccount.new(1000)
account.deposit(500) 
puts account.balance
account.withdraw(300)
puts account.balance

