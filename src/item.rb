class Item
  @next_item_id = 0

  def self.generate_id
    @next_item_id += 1
  end

  attr_reader :archived, :id
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Item.generate_id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    publish_date < (Time.now - (60 * 60 * 24 * 365 * 10))
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label,
      'publish_date' => @publish_date,
      'archived' => @archived
    }.to_json(*args)
  end
end

private :can_be_archived?

def self.json_create(object)
  item = new(object['genre'], object['author'], object['source'], object['label'], object['publish_date'])
  item.archived = object['archived']
  item
end
