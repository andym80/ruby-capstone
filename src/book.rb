require_relative './item'
require_relative './author'
require 'json'
require 'date'
require_relative '../src/label'
require 'securerandom'
require_relative '../src/item'

# disable: Metrics/ClassLength
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :author, :genre, :source, :publish_date

  def initialize( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    source,
    label,
    publish_date,
    publisher,
    cover_state = 'good'
  )
    super(title, genre, author, source, label, publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
    @author = author
    @genre = genre
    @source = source
    @label = label
    @publish_date = publish_date
    @id = SecureRandom.random_number(1_000)
    @items = []
  end

  def self.add_book(label, publisher, author)
    new_book = Book.new(label, publisher)
    print "The book '#{label.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author)
    new_author.add_item(new_book)

    new_book
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  private

  def can_be_archived?
    super && @cover_state == 'bad'
  end
end
