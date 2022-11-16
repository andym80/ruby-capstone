require 'date'

TEN_YEARS = 60 * 60 * 24 * 365 * 10

class Item
  @next_item_id = 0

  def self.generate_id
    @next_item_id += 1
  end

  attr_reader :archived, :id
  attr_accessor :genre, :author, :source, :label, :publish_date, :title

  def initialize(title, genre, author, source, label, publish_date) # rubocop:disable Metrics/ParameterLists
    @id = Item.generate_id
    @title = title
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false

    author.add_item(self)
  end

  def can_be_archived?
    publish_date < (DateTime.now - TEN_YEARS)
  end

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end

  private :can_be_archived?
end
