require_relative 'game'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'
require_relative 'author'

class App # rubocop:disable Metrics/ClassLength
  attr_reader :games, :albums, :authors, :genres, :labels

  def initialize
    @authors = []
    @genres = []
    @labels = []
    @games = []
    @albums = []
    @books = []
  end

  def there_not_something_message(something)
    "\nThere are no #{something} yet try adding some!\n"
  end

  def add_label(title, color)
    new_label = Label.new(title, color)
    @labels.push(new_label)
    new_label
  end

  def all_labels_list_str
    return there_not_something_message 'labels' if @labels.empty?

    list_str = "list of all labels:\n"
    @labels.each_with_index do |label, labels_index|
      list_str += "  [#{labels_index}] '#{label.title}' of color [#{label.color}] label for:\n"
      label.items.each_with_index do |item, items_index|
        list_str += "    [#{items_index}] #{item.title}\n"
      end
    end
    list_str
  end

  def add_author(first_name, last_name)
    new_author = Author.new(first_name, last_name)
    @authors.push(new_author)
    new_author
  end

  def all_authors_list_str
    return there_not_something_message 'authors' if @authors.empty?

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
    return there_not_something_message 'genres' if @genres.empty?

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
    label,
    publish_date,
    multiplayer,
    last_played_at
  )
    @games.push(Game.new(
                  title,
                  genre,
                  author,
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
    return there_not_something_message 'Game' if @games.empty?

    list_str = "list of all Game:\n"
    @games.each_with_index do |game, index|
      list_str += "[#{index}] '#{game.title}' "
      list_str += "is a #{singleplayer_or_multiplayer game.multiplayer} game "
      list_str += "last played at #{game.last_played_at}\n"
    end
    list_str
  end

  def on_spotify_message(is_on_spoty)
    is_on_spoty ? ' and is on spotify' : ''
  end

  def all_albums_list_str
    return there_not_something_message 'albums' if @albums.empty?

    rtn_str = "list of all albums:\n"
    @albums.each_with_index do |album, index|
      rtn_str += "[#{index}] '#{album.title}' Author: #{album.author}"
      rtn_str += "#{on_spotify_message album.on_spotify}\n"
    end
    rtn_str
  end

  def add_albums( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    label,
    publish_date,
    on_spotify
  )
    @albums.push(MusicAlbum.new(
                   title,
                   genre,
                   author,
                   label,
                   publish_date,
                   on_spotify
                 ))
  end

  def in_bad_state_message(cover_state)
    cover_state == 'bad' ? ', and cover in BAD state!' : ''
  end

  def all_books_list_str
    return there_not_something_message 'books' if @books.empty?

    list_str = "\nlist of all books:\n"
    @books.each_with_index do |book, index|
      list_str += "[#{index}] The Book: '#{book.title}' "
      list_str += "by #{book.author}  "
      list_str += "has been Published by #{book.publisher} on #{book.publish_date}"
      list_str += "#{in_bad_state_message book.cover_state}\n"
    end
    list_str
  end

  def add_book( # rubocop:disable Metrics/ParameterLists
    title,
    genre,
    author,
    label,
    publish_date,
    publisher,
    cover_state
  )
    @books.push(Book.new(
                  title,
                  genre,
                  author,
                  label,
                  publish_date,
                  publisher,
                  cover_state
                ))
  end
end
