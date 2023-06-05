class Item
  attr_reader :id, :genre, :author, :source, :label
  attr_accessor :publish_date


  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end


  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.add_item.include?(self)
  end


  def author=(author)
    @author = author
    author.add_items(self) unless author.add_items.include?(self)
  end


  def add_label=(label)
    @label = label
    label.add_items(self) unless label.add_items.include?(self)
  end


  def move_to_archive
    @archived = can_be_archived?
  end


  private


  def can_be_archived?
    current_time = Time.now.year
    published_at = Date.parse(publish_date).year
    archived = current_time - published_at
    archived > 10
  end
end


