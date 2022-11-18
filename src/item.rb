require 'date'
require 'json'
require 'securerandom'
require 'time'

TEN_YEARS = 60 * 60 * 24 * 365 * 10

class Item
  attr_reader :archived, :id
  attr_accessor :genre, :author, :label, :publish_date, :title

  def initialize(title, genre, author, label, publish_date, id = SecureRandom.random_number(1000)) # rubocop:disable Metrics/ParameterLists
    @id = id
    @title = title
    @genre = genre
    @author = author
    @label = label
    @publish_date = publish_date
    @archived = false

    author.add_item(self)
    genre.add_item(self)
    label.add_item(self)
  end

  def can_be_archived?
    publish_date < (Date.new - TEN_YEARS)
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end

  def to_hash
    {
      'id': @id,
      'title': @title,
      'genre': @genre.id,
      'author': @author.id,
      'label': @label.id,
      'publish_date': @publish_date,
      'archived': @archived
    }
  end

  private :can_be_archived?

  def self.json_create(object)
    item = new(object['genre'], object['author'], object['source'], object['label'], object['publish_date'])
    item.archived = object['archived']
    item
  end
end
