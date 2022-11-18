require 'securerandom'
require_relative '../src/item'
require 'json'
require 'date'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = SecureRandom.random_number(1_000))
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_s
    title
  end
end
