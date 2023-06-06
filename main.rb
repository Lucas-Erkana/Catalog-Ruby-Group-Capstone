require_relative 'app'

class Main
  puts 'Welcome to our catalog app'
  def select_option
    puts 'Please choose an option by entering a number:'
    puts '1). List all books'
    puts '2). List all music albums'
    puts '3). List all games'
    puts '4). List all genres'
    puts '5). List all labels'
    puts '6). List all authors'
    puts '7). Add a book'
    puts '8). Add a music album'
    puts '9). Add a game'
    puts '10). Exit'
  end

  def start
    new_app = App.new
    loop do
      select_option
      option = gets.chomp
      if option == '10'
        puts 'Thank you for using this app '
        break
      else
        new_app.select_option(option)
        new_app.add_items(option)
      end
    end
  end
end

def main
  app = Main.new
  app.start
end

main
