require_relative './item'
require_relative './author'
require 'json'
require 'date'

# disable: Metrics/ClassLength
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def self.add_book(label, publisher, author_first_name, author_last_name)
    new_book = Book.new(label, publisher)
    print "The book '#{label.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
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
