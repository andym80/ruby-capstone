require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    source,
    label,
    publish_date,
    multiplayer,
    last_played_at,
		id = SecureRandom.random_number(1000)
  )
    super(title, genre, author, source, label, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super() && (last_played_at < (DateTime.now - (60 * 60 * 24 * 365 * 2)))
  end
end
