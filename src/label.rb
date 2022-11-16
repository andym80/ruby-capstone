require './item'

class Label
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end
end

# add_item method in the Label class: should add self as a property of the item object (by using the correct setter from the item object)

def add_item(item)
  @items << item
  item.label = self
end
