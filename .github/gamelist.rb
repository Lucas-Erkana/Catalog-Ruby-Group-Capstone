require 'json'
require_relative 'game'
require_relative 'author'


class GameList
  attr_accessor :authors, :games


  def initialize
    @games = []
    @authors = []
    recover_game
    recover_author
  end


  def list_all_authors
    puts 'No author added' if @authors.empty?
    @authors.each { |author| puts "First name: #{author.first_name}, Last name: #{author.last_name}" }
    puts ''
  end


  def list_all_games
    puts 'No author added' if @authors.empty?
    @games.each do |game|
      puts "Last played: #{game.last_played_at}, Multiplayer: #{game.multiplayer}, Publish date: #{game.publish_date}"
    end
    puts ''
  end


  # last_played_at, multiplayer, publish_date,
  def add_game
    print 'Last played at (Year-MM-DD): '
    last_played_at = gets.chomp
    print 'Multiplayer (state the number): '
    multiplayer = gets.chomp
    print 'Publish date(Year-MM-DD): '
    publish_date = gets.chomp


    games_added = Game.new(last_played_at, multiplayer, publish_date)
    @games << games_added
    puts ''


    print 'Add first name: '
    first_name = gets.chomp
    print 'Add last name : '
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    save_game
    save_author
  end


  def save_game
    mapped_game = @games.map do |game|
      { id: game.id, last_played_at: game.last_played_at, multiplayer: game.multiplayer,
        publish_date: game.publish_date }
    end
    File.write('store/games.json', JSON.pretty_generate(mapped_game))
  end


  def recover_game
    return unless File.exist?('store/games.json')


    game_store = begin
      JSON.parse(File.read('store/games.json'))
    rescue StandardError
      []
    end
    game_store = game_store.map { |game| Game.new(game['last_played_at'], game['multiplayer'], game['publish_date']) }
    @games.concat(game_store) unless game_store.empty?
  end


  def save_author
    authors = @authors.map { |author| { first_name: author.first_name, last_name: author.last_name } }
    File.write('store/authors.json', JSON.pretty_generate(authors))
  end


  def recover_author
    return unless File.exist?('store/authors.json')


    author_store = begin
      JSON.parse(File.read('store/authors.json'))
    rescue StandardError
      []
    end
    author_store = author_store.map { |author| Author.new(author['first_name'], author['last_name']) }
    @authors.concat(author_store) unless author_store.empty?
  end
end
