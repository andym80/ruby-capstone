require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize( # rubocop:disable Metrics/ParameterLists
    genre,
    author,
    source,
    label,
    publish_date,
    multiplayer,
    last_played_at
  )
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super() && (last_played_at < (DateTime.now - (60 * 60 * 24 * 365 * 2)))
  end

  def to_s
		to_s_rtn = super()
    to_s_rtn += "#{@multiplayer} "
		to_s_rtn += "#{@last_played_at} "
		to_s_rtn
  end
end
