class Main
  def puts_options
    puts '[e] - Exit'
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
      when 'e'
        # CASE [e] Exit
        puts "Exit\n"
        break
      else
        puts "You gave me #{option} -- I have no idea what to do with that.\n"
      end
    end
  end
end

Main.new.run
