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

  def save_music_album(album)
    data = get_data('music_album')
    data << { label: album.label, author: album.author }
    data_upgrade('music_album', data)

    puts "The album '#{album.label.upcase}' by #{album.author.upcase} was created successfully!"
  end

  def load_books
    get_data('books').map { |book| Book.new(book['title'], book['author']) }
  end

  def save_books(book)
    data = get_data('books')
    data << { title: book.title, author: book.author }
    data_upgrade('books', data)

    puts "The book '#{book.title.upcase}' by #{book.author.upcase} was created successfully!"
  end

	def load(_games)
		get_data('games').map { |game| Game.new(game['title'], game['author']) }
	end

	def save_games(game)
		data = get_data('games')
		data << { title: game.title, author: game.author }
		data_upgrade('games', data)

		puts "The game '#{game.title.upcase}' by #{game.author.upcase} was created successfully!"
	end
end


@author = [
	Author.new('Author 0 fn', 'Author 0 ln'),
	 Author.new('Author 1 fn', 'Author 1 ln'),
	]
@genre = [
	Genre.new('genre 0'),
	Genre.new('genre 1'),
	Genre.new('genre 2'),
]
@label = [
	Label.new('The Label', 'The Color'),
]

@books = [
	Book.new(
		'The Book 0',
		@genre[0],
		@author[0],
		'The Source',
		@label[0],
		Date.today,
		'The Publisher'
	),
	Book.new(
		'The Book 1',
		@genre[1],
		@author[0],
		'The Source',
		@label[0],
		Date.today,
		'The Publisher'
	),
	Book.new(
		'The Book 2',
		@genre[2],
		@author[1],
		'The Source',
		@label[0],
		Date.today,
		'The Publisher'
	)
]

@games = [
	Game.new(
		'Game 0 title',
		@genre[2],
		@author[1],
		'source',
		@label[0],
		Date.today ,
		true,
		Date.today
	),
	Game.new(
		'Game 1 title',
		@genre[2],
		@author[1],
		'source',
		@label[0],
		Date.today,
		false,
		Date.today
	),
]


@albums = [
	MusicAlbum.new(
    'MusicAlbum',
    @genre[2],
    @author[0],
    'source',
    @label[0],
    Date.today,
    false
  )
]

class Run
	include PreserveData
end

runnn = Run.new()

runnn.save_books(@books[0])
