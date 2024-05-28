class Post

  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    return post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = nil
  end

  # Абстрактные методы:

  # Определяются в родительском классе, но не имеют реализации.
  # Подклассы должны предоставить реализацию этих методов.
  # Используются для создания шаблонов классов.

  def read_from_console
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end

  def to_strings
    raise NotImplementedError, 'This method must be implemented in a subclass'
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    for item in to_strings do
      file.puts(item)
    end

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__)
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d%H-%M-%S.txt")

    return current_path + "/" + file_name
  end
end