require 'securerandom'

class Author

  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name,	id = SecureRandom.random_number(1000))
    @id = id
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

	def to_hash
		{
			'id': @id,
'first_name': @first_name,
'last_name': @last_name
		}
	end


  def to_s
    to_s_full_name
  end
end
