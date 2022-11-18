require_relative 'src/app'
require './helper'

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
    puts ' - [3] List of games'
    puts ' - [4] List all genres'
    puts ' - [5] List all labels'
    puts ' - [6] List all authors'
    puts ' - [7] Add a book'
    puts ' - [8] Add a music album'
    puts ' - [9] Add a game'
    puts ' - [X] - Exit'
  end

  def created_message(title)
    "'#{title.upcase}' was created successfully!"
  end

  def option_in
    puts 'Please choose a option by enterin a number:'
    puts "\n"
    puts_options
    option = gets.chomp.downcase
    puts "\n"
    option
  end

  def please_introduce_input(field)
    puts "please intoduce a #{field}"
    gets.chomp
  end

  def input_label
    title = please_introduce_input 'Label title'
    color = please_introduce_input 'Label color'

    @app.add_label(title, color)
  end

  def input_genre
    @app.add_genre(please_introduce_input('genre'))
  end

  def input_author
    first_name = please_introduce_input 'Author first name'
    last_name = please_introduce_input 'Author last name'

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

  def choose_date_input(date_for)
    input_date = ''
    until Date.parsable?(input_date)
      puts "Please Input a date (YYYY-MM-DD) for #{date_for}"
      input_date = gets.chomp.downcase
    end
    Date.parse(input_date)
  end

  def choose_author_input
    choose_from_list(@app.authors, 'author', method(:input_author))
  end

  def choose_genre_input
    choose_from_list(@app.genres, 'genre', method(:input_genre))
  end

  def choose_label_input
    choose_from_list(@app.labels, 'label', method(:input_label))
  end

  # input for (genre, author, source, label, publish_date) return a map
  def input_item_obj
    rtn_obj = {}

    puts 'WARNING W.I.P'

    rtn_obj[:title] = please_introduce_input 'title'
    rtn_obj[:genre] = choose_genre_input
    rtn_obj[:author] = choose_author_input
    rtn_obj[:source] = 'choose_source_input'
    rtn_obj[:label] = choose_label_input
    rtn_obj[:publish_date] = choose_date_input 'date of publish'

    rtn_obj
  end

  def true_or_false_question(question)
    puts "#{question} [Y]"
    gets.chomp.downcase == 'y'
  end

  def cover_in_bad_condition_input
    true_or_false_question('is the cover in bad condition?') ? 'bad' : 'good'
  end

  def input_game_option
    item_map = input_item_obj

    multiplayer = true_or_false_question 'is multiplayer?'

    last_played_at = choose_date_input 'last played at'

    created_message item_map[:title]

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

    created_message item_map[:title]
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

    created_message item_map[:title]
  end

  def input_book_option
    item_map = input_item_obj

    publisher = please_introduce_input 'Publisher'
    cover_state = cover_in_bad_condition_input

    @app.add_book(
      item_map[:title],
      item_map[:genre],
      item_map[:author],
      item_map[:source],
      item_map[:label],
      item_map[:publish_date],
      publisher,
      cover_state
    )

    created_message item_map[:title]
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
        puts @app.all_books_list_str
        press_enter_message
      when '2' # CASE [2] List all music albums
        puts @app.all_albums_list_str
        press_enter_message
      when '3' # CASE [3] List of games
        puts @app.all_games_list_str
        press_enter_message
      when '4' # CASE [4] List all genres
        puts @app.all_genres_list_str
        press_enter_message
      when '5' # CASE [5] List all labels
        puts @app.all_labels_list_str
        press_enter_message
      when '6' # CASE [6] List all authors
        puts @app.all_authors_list_str
        press_enter_message
      when '7' # CASE [7] Add a book
        input_book_option
      when '8' # CASE [8] Add a music album
        input_album_option
      when '9' # CASE [9] Add a game
        input_game_option
      when 'x' # CASE [x] Exit
        puts "Exit\n"
        break
      else
        puts_not_valit_option option
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end

main = Main.new
puts main.run
