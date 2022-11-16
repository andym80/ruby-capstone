require 'item'
require 'secure_random'
require 'json'

class Genre
  attr_accesor :id, :name, :items, :add_item

  initialize(name, items, add_item)
  @id || SecureRandom.random_number(1000)
  @name = name
  @items = []
  @add_item = add_item
end

def add_item(item)
  @items << item
  item.self = self
end
