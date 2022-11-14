class Main
  def puts_options
		puts ' - [1] List all books'
		puts ' - [2] List all music albums'
		puts ' - [3] List all movies'
		puts ' - [4] List of games'
		puts ' - [5] List all genres'
		puts ' - [6] List all labels'
		puts ' - [7] List all authors'
		puts ' - [8] List all sources'
		puts ' - [9] Add a book'
		puts ' - [10] Add a music album'
		puts ' - [11] Add a movie'
		puts ' - [12] Add a game'
    puts ' - [X] - Exit'
  end

  def option_in
    puts 'Please choose a option by enterin a number:'
    puts "\n"
    puts_options
    option = gets.chomp.downcase
    puts "\n"
    option
  end

  def run
    loop do
      case option_in
			when '1' # CASE [1] List all books
				raise NotImplementedError, "#{self.class} has not implemented method 'List all books'"
			when '2' # CASE [2] List all music albums
				raise NotImplementedError, "#{self.class} has not implemented method 'List all music albums'"
			when '3' # CASE [3] List all movies
				raise NotImplementedError, "#{self.class} has not implemented method 'List all movies'"
			when '4' # CASE [4] List of games
				raise NotImplementedError, "#{self.class} has not implemented method 'List of games'"
			when '5' # CASE [5] List all genres
				raise NotImplementedError, "#{self.class} has not implemented method 'List all genres'"
			when '6' # CASE [6] List all labels
				raise NotImplementedError, "#{self.class} has not implemented method 'List all labels'"
			when '7' # CASE [7] List all authors
				raise NotImplementedError, "#{self.class} has not implemented method 'List all authors'"
			when '8' # CASE [8] List all sources
				raise NotImplementedError, "#{self.class} has not implemented method 'List all sources'"
			when '9' # CASE [9] Add a book
				raise NotImplementedError, "#{self.class} has not implemented method 'Add a book'"
			when '10' # CASE [10] Add a music album
				raise NotImplementedError, "#{self.class} has not implemented method 'Add a music album'"
			when '11' # CASE [11] Add a movie
				raise NotImplementedError, "#{self.class} has not implemented method 'Add a movie'"
			when '12' # CASE [12] Add a game
				raise NotImplementedError, "#{self.class} has not implemented method 'Add a game'"
      when 'x'  # CASE [x] Exit
        puts "Exit\n"
        break
      else
        puts "You gave me #{option} -- I have no idea what to do with that.\n"
      end
    end
  end
end

Main.new.run
