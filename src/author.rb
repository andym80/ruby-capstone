class Author
  @next_id = 0

  def self.generate_id
    @next_id += 1
  end

  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @id = Author.generate_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author.items.delete item
    items.push(item)
    item.author = self
  end

  def to_s_full_name
    "#{first_name} #{last_name}"
  end
end
