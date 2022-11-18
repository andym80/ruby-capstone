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

  def self.list_items
    @items
  end

  def self.list_labels(things)
    labels = []
    things.each do |thing|
      labels << thing.label if thing.instance_of?(Book) && !labels.include?(thing.label.title)
    end
    labels.each_with_index do |label, index|
      puts "[#{index}] #{label.title} - #{label.color}"
    end
  end

  def to_s
    title
  end
end
