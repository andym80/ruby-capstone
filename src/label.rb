require 'securerandom'
require_relative '../src/item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = SecureRandom.random_number(1_000))
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def self.list_labels(things)
    labels = []
    things.each do |thing|
      labels << thing.label
      labels.each_with_index do |label, index|
        puts "[#{index + 1}]. (ID: #{label.id}) #{label.title})"
      end
    end
  end

  def list_items_by_publisher(publisher)
    @items.select { |item| item.source == publisher }
  end

  def list_items_by_author(author)
    @items.select { |item| item.author == author }
  end

  def list_items_by_author_and_publisher(author, publisher)
    @items.select { |item| item.author == author && item.source == publisher }
  end

  def list_items_by_genre(genre)
    @items.select { |item| item.genre == genre }
  end

  def list_items_by_author_and_publisher_and_genre(author, publisher, genre)
    @items.select { |item| item.author == author && item.source == publisher && item.genre == genre }
  end
end

def add_label(label, color)
  new_label = Label.new(label, color)
  puts "The label '#{label.upcase}' was created successfully!"
  new_label
end
