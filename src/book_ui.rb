require 'json'
require 'date'

class BookUserInterface
  attr_reader :books

  def initialize
    @books = []
    @books_length = 0
    @path = 'books.json'
  end

  def add_book(book)
    @books << book
    @books_length += 1
  end

  @books << Book.new(title, author)
  puts "The book '#{title.upcase}' by #{author.upcase} was created successfully!"
end

def save_books_data
  return unless @books_length > books_length

  if File.exist?(@path)
    if File.empty?(@path)
      File.write(@path, JSON.pretty_generate(@books))
    else
      File.write(@path, JSON.pretty_generate(@books), mode: 'a')
    end
  else
    File.write(@path, JSON.pretty_generate(@books))
  end
end

def retrieved_books_data_from_file
  return unless File.exist?(@path) && !File.empty?(@path)

  retrieved_data = JSON.parse(File.read(@path))
  retrieved_data.each do |book|
    @books << Book.new(book['title'], book['author'])
  end
  @books_length = @books.length
end

def load_books_data
  if File.exist?(@path)
    @books = JSON.parse(File.read(@path))
  else
    puts 'There is no data to load'
  end
end

def list_books_by_publisher(publisher)
  @books.select { |book| book.publisher == publisher }
end

def list_books_by_author(author)
  @books.select { |book| book.author == author }
end

def list_books_by_author_and_publisher(author, publisher)
  @books.select { |book| book.author == author && book.publisher == publisher }
end

def list_books_by_genre(genre)
  @books.select { |book| book.genre == genre }
end

def list_books_by_author_and_publisher_and_genre(author, publisher, genre)
  @books.select { |book| book.author == author && book.publisher == publisher && book.genre == genre }
end
