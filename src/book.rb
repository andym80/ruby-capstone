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
  attr_reader :author, :genre, :publish_date

  def initialize( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    label,
    publish_date,
    publisher,
    cover_state = 'good',
		id = SecureRandom.random_number(1000)
  )
    super(title, genre, author, label, publish_date, id)
    @cover_state = cover_state
    @publisher = publisher
  end

  def self.add_book(label, publisher, author)
    new_book = Book.new(label, publisher)
    print "The book '#{label.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author)
    new_author.add_item(new_book)
    new_book
  end

	def to_hash
		super().merge({
			'cover_state': @cover_state,
			'publisher': @publisher
		})
	end

  def can_be_archived?
    super && @cover_state == 'bad'
  end
end
