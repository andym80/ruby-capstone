require_relative './item'
require 'secure_random'

class Genre
  attr_accesor :id, :name, :items, :add_item

  initialize(id, name, items, input)
  @id || SecureRandom.random_number(1000)
  @name = name
  @items = []
  @add_item = input
end

def add_item(item)
  @items << item
  item.self = self
end
