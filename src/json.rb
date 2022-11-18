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

  def load_music_album
    get_data('music_album').map { |album| MusicAlbum.new(album['label'], album['author']) }
  end

  def load_books
    get_data('books').map { |book| Book.new(book['title'], book['author']) }
  end

	def load(_games)
		get_data('games').map { |game| Game.new(game['title'], game['author']) }
	end

	def save_games(game)
		data = get_data('games')
		data << game.to_hash
		data_upgrade('games', data)
	end

  def save_books(book)
    data = get_data('books')
    data << book.to_hash
    data_upgrade('books', data)
  end

  def save_music_album(album)
    data = get_data('music_album')
    data << album.to_hash
    data_upgrade('music_album', data)
  end
end


@authors = [
	Author.new('Author 0 fn', 'Author 0 ln'),
	 Author.new('Author 1 fn', 'Author 1 ln'),
	]
@genres = [
	Genre.new('genre 0'),
	Genre.new('genre 1'),
	Genre.new('genre 2'),
]
@labels = [
	Label.new('The Label', 'The Color'),
]

@books = [
	Book.new(
		'The Book 0',
		@genres[0],
		@authors[0],
		@labels[0],
		Date.today,
		'The Publisher'
	),
	Book.new(
		'The Book 1',
		@genres[1],
		@authors[0],
		@labels[0],
		Date.today,
		'The Publisher'
	),
	Book.new(
		'The Book 2',
		@genres[2],
		@authors[1],
		@labels[0],
		Date.today,
		'The Publisher'
	)
]

@games = [
	Game.new(
		'Game 0 title',
		@genres[2],
		@authors[1],
		@labels[0],
		Date.today ,
		true,
		Date.today
	),
	Game.new(
		'Game 1 title',
		@genres[2],
		@authors[1],
		@labels[0],
		Date.today,
		false,
		Date.today
	),
]


@albums = [
	MusicAlbum.new(
    'MusicAlbum',
    @genres[2],
    @authors[0],
    @labels[0],
    Date.today,
    false
  )
]

class Run
	include PreserveData
end

runnn = Run.new()

#runnn.save_books(@books[0])

@books.each do |book|
	runnn.save_books(book)
end

@games.each do |game|
	runnn.save_games(game)
end

@albums.each do |album|
	runnn.save_music_album(album)
end

# p @books[0].to_json
