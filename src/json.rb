require_relative 'music_album'
require_relative 'book'
require_relative 'game'
require_relative 'author'
require_relative 'genre'
require_relative 'label'
require 'json'

module PreserveData
  def get_data(file)
    file_path = "./DATA/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def data_upgrade(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json_data = JSON.generate(data, opts)
    File.write("./DATA/#{file}.json", json_data)
  end

  def load_albums
    @albums = get_data('music_album').map do |album_hash|
      MusicAlbum.new(
        album_hash['title'],
        @genres.find { |e| e.id == album_hash['genre'] },
        @authors.find { |e| e.id == album_hash['author'] },
        @labels.find { |e| e.id == album_hash['label'] },
        Date.parse(album_hash['publish_date']),
        album_hash['on_spotify'],
        album_hash['id']
      )
    end || []
  end

  def load_books
    @books = get_data('books').map do |book_hash|
      Book.new(
        book_hash['title'],
        @genres.find { |e| e.id == book_hash['genre'] },
        @authors.find { |e| e.id == book_hash['author'] },
        @labels.find { |e| e.id == book_hash['label'] },
        Date.parse(book_hash['publish_date']),
        book_hash['publisher'],
        book_hash['cover_state'],
        book_hash['id']
      )
    end || []
  end

  def load_games
    @games = get_data('games').map do |game_hash|
      Game.new(
        game_hash['title'],
        @genres.find { |e| e.id == game_hash['genre'] },
        @authors.find { |e| e.id == game_hash['author'] },
        @labels.find { |e| e.id == game_hash['label'] },
        Date.parse(game_hash['publish_date']),
        game_hash['multiplayer'],
        Date.parse(game_hash['last_played_at']),
        game_hash['id']
      )
    end || []
  end

  def load_authors
    @authors = get_data('authors').map do |author_hash|
      Author.from_hash(author_hash)
    end || []
  end

  def load_genres
    @genres = get_data('genres').map do |genre_hash|
      Genre.from_hash(genre_hash)
    end || []
  end

  def load_labels
    @labels = get_data('labels').map do |label_hash|
      Label.from_hash(label_hash)
    end || []
  end

  def save_item(file_name, list)
    data = list.map(&:to_hash)
    data_upgrade(file_name, data)
  end

  def save_games
    save_item('games', @games)
  end

  def save_books
    save_item('books', @books)
  end

  def save_albums
    save_item('music_album', @albums)
  end

  def save_authors
    save_item('authors', @authors)
  end

  def save_genres
    save_item('genres', @genres)
  end

  def save_labels
    save_item('labels', @labels)
  end
end

class Run
  include PreserveData
  attr_accessor :authors, :genres, :labels, :albums, :games, :books

  def initialize()
    load_authors
    load_genres
    load_labels
    load_albums
    load_games
    load_books
  end
end

# @books = [
# 	Book.new(
# 		'The Book 0',
# 		@genres[0],
# 		@authors[0],
# 		@labels[0],
# 		Date.today,
# 		'The Publisher'
# 	),
# 	Book.new(
# 		'The Book 1',
# 		@genres[1],
# 		@authors[0],
# 		@labels[0],
# 		Date.today,
# 		'The Publisher'
# 	),
# 	Book.new(
# 		'The Book 2',
# 		@genres[2],
# 		@authors[1],
# 		@labels[0],
# 		Date.today,
# 		'The Publisher'
# 	)
# ]

# @games = [
# 	Game.new(
# 		'Game 0 title',
# 		@genres[2],
# 		@authors[1],
# 		@labels[0],
# 		Date.today ,
# 		true,
# 		Date.today
# 	),
# 	Game.new(
# 		'Game 1 title',
# 		@genres[2],
# 		@authors[1],
# 		@labels[0],
# 		Date.today,
# 		false,
# 		Date.today
# 	),
# ]

# @albums = [
# 	MusicAlbum.new(
#     'MusicAlbum',
#     @genres[2],
#     @authors[0],
#     @labels[0],
#     Date.today,
#     false
#   )
# ]

# #runnn.save_books(@books[0])

# @authors.each do |author|
# 	runnn.save_authors(author)
# end

# @genres.each do |genre|
# 	runnn.save_genres(genre)
# end

# @labels.each do |label|
# 	runnn.save_labels(label)
# end

# # p @books[0].to_json
