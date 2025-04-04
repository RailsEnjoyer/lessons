module Timestampable
  def initialize_timestamps
    time_str = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    @created_at = time_str
    @updated_at = time_str
  end

  def created_at
    "was created at: #{@created_at}"
  end

  def updated_at
    "was updated at: #{@updated_at}"
  end

  def touch
    @updated_at = Time.now.strftime('%Y-%m-%d %H:%M:%S')
  end
end

class Article
  attr_reader :title
  include Timestampable

  def initialize(title)
    @title = title
    initialize_timestamps
  end

  def update(title)
    @title = title
    touch
  end
end

class Comment
  attr_reader :content
  include Timestampable

  def initialize(content)
    @content = content
    initialize_timestamps
  end

  def update(content)
    @content = content
    touch
  end
end

article = Article.new('1984')
comment = Comment.new('роман-антиутопия Джорджа Оруэлла, изданный в 1949 году. Последнее и, по господствующему мнению, самое главное произведение писателя.')

puts article.title
puts comment.content

sleep(1)

comment.update('роман-антиутопия Джорджа Оруэлла, изданный в 1949 году.')
puts comment.content
puts comment.created_at
puts comment.updated_at