require_relative './item'

class Book < Item > # Book class inherits from the Item class
  attr_accessor :publisher, :cover_state, :id

  def initialize(publisher, cover_state, *args)
	super(*args) # call the parent class's constructor
	@publisher = publisher
	@cover_state = cover_state
  end

def self.list_books(books)
	books.each_with_index do |book, index|
		if book_instance_of? Book
			puts "[#{index}] The Book: #{book.cover_state} by #{book.author.first_name} #{book.author.last_name} has been Published by #{book.publisher} on #{book.publish_date}"
		end
	end
end

def self.add_book
	print 'Author\'s first name?'
    print "\nAnswer: "
    author_first_name = gets.chomp

	print "\nType a Cover State of the Book: "
    cover_state = gets.chomp
    print "\nType the Name of the publisher: "
    publisher = gets.chomp

    print "\nType a publish date [year]: "
    print "\nAnswer: "
    book_date = gets.chomp.to_i

    new_book = Book.new(book_date, cover_state, publisher)
    puts "The book '#{cover_state.upcase}' by #{publisher.upcase} was created successfully!"
    new_author = Author.new(author_first_name, author_last_name)
    new_author.add_item(new_book)

    new_book
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publisher' => @publisher,
      'cover_state' => @cover_state
    }.to_json(*args)
  end

  private

  def can_be_archived?
	super  @cover_state == 'bad'
  end


end
