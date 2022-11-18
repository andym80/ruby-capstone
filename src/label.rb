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

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def self.from_hash(hash)
    Label.new(
      hash['title'],
      hash['color'],
      hash['id']
    )
  end
end
