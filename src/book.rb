require_relative './item'
require_relative './author'
require 'json'
require 'date'
require_relative '../src/label.rb'
require 'securerandom'
require_relative '../src/item'

# disable: Metrics/ClassLength
class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :author, :genre, :source, :publish_date

  def initialize(
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

  def self.list_books_by_publisher(publisher)
    @items.select { |item| item.source == publisher }
  end

  def self.list_books_by_author(author)
    @items.select { |item| item.author == author }
  end

  def self.list_books_by_author_and_publisher(author, publisher)
    @items.select { |item| item.author == author && item.source == publisher }
  end

  def self.list_books_by_genre(genre)
    @items.select { |item| item.genre == genre }
  end

  def self.list_books_by_author_and_publisher_and_genre(author, publisher, genre)
    @items.select { |item| item.author == author && item.source == publisher && item.genre == genre }
  end

  def self.list_books(books)
    books.each_with_index do |book, index|
      if book_instance_of? Book
        puts "[#{index}] The Book: #{book.cover_state} by #{book.author.first_name}
         #{book.author.last_name} has been Published by #{book.publisher} on #{book.publish_date}"
      end
    end
  end

  private

  def can_be_archived?
    super && @cover_state == 'bad'
  end
end
