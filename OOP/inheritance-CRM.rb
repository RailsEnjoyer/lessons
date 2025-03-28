class Employee
  def initialize(params)
    @name = params[:name]
    @age = params[:age]
    @base_salary = params[:base_salary]
  end

  def total_salary
    raise NotImplementedError, 'Method should be realised in child classes'
  end

  def work
    raise NotImplementedError, 'Method should be realised in child classes'
  end
end

class Manager < Employee
  def initialize(params)
    super(params)
    @team_size = params[:team_size]
  end

  def work
    "менеджер #{@name} проводит совещания, управляет командой из #{@team_size} человек и контролирует работу сотрудников"
  end

  def total_salary
    bonus = @base_salary * (@team_size * 0.1)
    @base_salary + bonus
  end
end

class Developer < Employee
  def initialize(params)
    super(params)
    @programming_languages = Array(params[:programming_languages])
  end

  def upgrade_skills(language)
    @programming_languages << language
  end

  def work
    "разработчик #{@name} пишет код, решает задачи и использует #{@programming_languages.join(', ')}"
  end

  def total_salary
    bonus = @base_salary * (@programming_languages.size * 0.3)
    @base_salary + bonus
  end
end

manager = Manager.new(name: 'Ilia Ismailau', age: 23, base_salary: 2600, team_size: 11)
developer = Developer.new(name: 'Bogdan Davidovich', age: 22, base_salary: 2000, programming_languages: 'Ruby')

developer.upgrade_skills('Ruby on Rails')

puts manager.work
puts "с итоговой зарплатой с учетом бонусов: #{manager.total_salary}"

puts developer.work
puts "с итоговой зарплатой с учетом бонусов: #{developer.total_salary}"
