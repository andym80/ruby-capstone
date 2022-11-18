require_relative './item'
require 'json'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id

  def initialize( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    label,
    publish_date,
    on_spotify,
    id = SecureRandom.random_number(1000)
  )
    super(title, genre, author, label, publish_date, id)
    @on_spotify = on_spotify
  end

  def to_hash
    super().merge({
                    on_spotify: @on_spotify
                  })
  end

  def can_be_archived?
    super && @on_spotify
  end
end
