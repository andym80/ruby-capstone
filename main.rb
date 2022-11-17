require_relative 'src/app'
require './helper'
require './src/book_ui'

class Main # rubocop:disable Metrics/ClassLength
  def initialize()
    @app = App.new
  end

  def puts_not_valit_option(option)
    puts "You gave me [#{option}] -- I have no idea what to do with that.\n"
  end

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

  def input_genre
    puts 'please write Genre name'
    name = gets.chomp

    @app.add_genre(name)
  end

  def input_author
    puts 'please write Author first name'
    first_name = gets.chomp
    puts 'please write Author last name'
    last_name = gets.chomp

    @app.add_author(first_name, last_name)
  end

  def valid_list_option?(option, list)
    option.match?(/\A\d+\z/) && (option.to_i >= 0) && (option.to_i < list.length)
  end

  def choose_from_list(list, prop_name, input_method)
    loop do
      return input_method.call if list.empty?

      puts "plase choose a #{prop_name} form the list bellow or add a new one with the letter [A] "
      list.each_with_index do |item, index|
        puts "[#{index}] #{item}"
      end
      option = gets.chomp.downcase
      return list[option.to_i] if valid_list_option?(option, list)
      return input_method.call if option == 'a'

      puts_not_valit_option option
    end
  end

  def choose_author_input
    choose_from_list(@app.authors, 'author', method(:input_author))
  end

  def choose_genre_input
    choose_from_list(@app.genres, 'genre', method(:input_genre))
  end

  def choose_date_input(date_for)
    input_date = ''
    until Date.parsable?(input_date)
      puts "Please Input a date (YYYY-MM-DD) for #{date_for}"
      input_date = gets.chomp.downcase
    end
    Date.parse(input_date)
  end

  def choose_title_input
    puts 'please intoduce a title'
    gets.chomp
  end

  # input for (genre, author, source, label, publish_date) return a map
  def input_item_obj
    rtn_obj = {}

    puts 'WARNING W.I.P'

    rtn_obj[:title] = choose_title_input
    rtn_obj[:genre] = choose_genre_input
    rtn_obj[:author] = choose_author_input
    rtn_obj[:source] = 'choose_source_input'
    rtn_obj[:label] = 'choose_label_input'
    rtn_obj[:publish_date] = choose_date_input 'date of publish'

    rtn_obj
  end

  def true_or_false_question(question)
    puts "#{question} [Y]"
    option = gets.chomp.downcase

    option == 'y'
  end

  def input_game_option
    item_map = input_item_obj

    multiplayer = true_or_false_question 'is multiplayer?'

    last_played_at = choose_date_input 'last played at'

    @app.add_game(
      item_map[:title],
      item_map[:genre],
      item_map[:author],
      item_map[:source],
      item_map[:label],
      item_map[:publish_date],
      multiplayer,
      last_played_at
    )
  end

  def input_album_option
    item_map = input_item_obj

    on_spotify = true_or_false_question 'is on spotify?'

    @app.add_albums(
      item_map[:title],
      item_map[:genre],
      item_map[:author],
      item_map[:source],
      item_map[:label],
      item_map[:publish_date],
      on_spotify
    )
  end

  def press_enter_message
    puts "Press ENTER to continue\n"
    gets
  end

  # rubocop:disable Metrics/BlockLength
  def run
    loop do
      option = option_in
      case option
      when '1' # CASE [1] List all books
        raise NotImplementedError, "#{self.class} has not implemented method 'List all books'"
      when '2' # CASE [2] List all music albums
        puts @app.all_albums_list_str
        press_enter_message
      when '3' # CASE [3] List all movies
        raise NotImplementedError, "#{self.class} has not implemented method 'List all movies'"
      when '4' # CASE [4] List of games
        puts @app.all_games_list_str
        press_enter_message
      when '5' # CASE [5] List all genres
        puts @app.all_genres_list_str
        press_enter_message
      when '6' # CASE [6] List all labels
        raise NotImplementedError, "#{self.class} has not implemented method 'List all labels'"
      when '7' # CASE [7] List all authors
        puts @app.all_authors_list_str
        press_enter_message
      when '8' # CASE [8] List all sources
        raise NotImplementedError, "#{self.class} has not implemented method 'List all sources'"
      when '9' # CASE [9] Add a book
        raise NotImplementedError, "#{self.class} has not implemented method 'Add a book'"
      when '10' # CASE [10] Add a music album
        input_album_option
      when '11' # CASE [11] Add a movie
        raise NotImplementedError, "#{self.class} has not implemented method 'Add a movie'"
      when '12' # CASE [12] Add a game
        input_game_option
      when 'x' # CASE [x] Exit
        puts "Exit\n"
        break
      else
        puts_not_valid_option option
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end

main = Main.new
puts main.run
