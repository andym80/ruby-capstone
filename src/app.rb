require_relative 'author'
require_relative 'game'
require_relative 'music_album'
require_relative 'genre'

class App
  attr_reader :games, :albums, :authors, :genres, :labels

  def initialize
    @games = []
    @albums = []
    @authors = []
    @genres = []
    @labels = []
  end

  def add_author(first_name, last_name)
    new_author = Author.new(first_name, last_name)
    @authors.push(new_author)
    new_author
  end

  def all_authors_list_str
    list_str = "list of all autors:\n"
    @authors.each_with_index do |author, authors_index|
      list_str += "  [#{authors_index}] #{author.to_s_full_name} author of:\n"
      author.items.each_with_index do |item, items_index|
        list_str += "    [#{items_index}] #{item.title}\n"
      end
    end
    list_str
  end

  def add_genre(neme)
    new_genre = Genre.new(neme)
    @genres.push(new_genre)
    new_genre
  end

  def all_genres_list_str
    list_str = "list of all genres:\n"
    @genres.each_with_index do |genre, genres_index|
      list_str += "  [#{genres_index}] #{genre.name} include:\n"
      genre.items.each_with_index do |item, items_index|
        list_str += "    [#{items_index}] #{item.title}\n"
      end
    end
    list_str
  end

  def add_game( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    source,
    label,
    publish_date,
    multiplayer,
    last_played_at
  )
    @games.push(Game.new(
                  title,
                  genre,
                  author,
                  source,
                  label,
                  publish_date,
                  multiplayer,
                  last_played_at
                ))
  end

  def singleplayer_or_multiplayer(is_multiplayer)
    is_multiplayer ? 'multiplayer' : 'singleplayer'
  end

  def all_games_list_str
    list_str = "list of all Game:\n"
    @games.each_with_index do |game, index|
      list_str += "[#{index}] '#{game.title}' "
      list_str += "is a #{singleplayer_or_multiplayer game.multiplayer} game "
      list_str += "last played at #{game.last_played_at}\n"
    end
    list_str
  end

  def all_albums_list_str
    rtn_str = "list of all albums:\n"
    @albums.each_with_index do |album, index|
      rtn_str += "[#{index}] '#{album.title}' Author: #{album.author}\n"
    end
    rtn_str
  end

  def add_albums( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    source,
    label,
    publish_date,
    on_spotify
  )
    @albums.push(MusicAlbum.new(
                   title,
                   genre,
                   author,
                   source,
                   label,
                   publish_date,
                   on_spotify
                 ))
  end
end
