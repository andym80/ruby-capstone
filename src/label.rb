require './item'

class Label
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end
end
