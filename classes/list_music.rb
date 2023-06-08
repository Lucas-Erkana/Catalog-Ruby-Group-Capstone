require_relative './music_album'
require_relative './genre'
require 'json'

class MusicList
  attr_accessor :albums, :genres

  def initialize
    @albums = []
    @genres = []
    recover_data
    recover_genre
  end

  def list_all_genre
    puts 'No genre added' if @genres.empty?
    @genres.each { |genre| puts "Genre:  #{genre.name}" }
    puts ''
  end

  def list_all_music_albums
    puts 'No music added' if @albums.empty?
    @albums.each do |album|
      puts "Publish date: #{album.publish_date}, On spotify: #{album.on_spotify}"
    end
    puts ''
  end

  def add_music_album
    print 'Publish date (Year-MM-DD): '
    publish_date = gets.chomp
    on_spotify = prompt_on_spotify

    music_album = MusicAlbum.new(on_spotify, publish_date)
    @albums << music_album
    puts 'Album created successfully'
    puts ''

    print 'Add genre (Pop, Rock, HipHop): '
    name = gets.chomp
    @genres << Genre.new(name)
    puts "#{name} genre created successfully"
    puts ''
    save
    save_genre
  end

  def prompt_on_spotify
    loop do
      print 'On Spotify (Enter t-True/f-False): '
      input = gets.chomp.downcase
      return input == 't' if %w[t f].include?(input)

      puts 'Invalid input. Please enter either t or f.'
    end
  end

  def save
    albums = @albums.map { |album| { id: album.id, publish_date: album.publish_date, on_spotify: album.on_spotify } }
    File.write('store/music.json', JSON.pretty_generate(albums))
  end

  def recover_data
    return unless File.exist?('store/music.json')

    album_store = begin
      JSON.parse(File.read('store/music.json'))
    rescue StandardError
      []
    end
    album_load = album_store.map { |music| MusicAlbum.new(music['on_spotify'], music['publish_date']) }
    @albums.concat(album_load) unless album_load.empty?
  end

  def save_genre
    genres = @genres.map { |genre| { name: genre.name } }
    File.write('store/genre.json', JSON.pretty_generate(genres))
  end

  def recover_genre
    return unless File.exist?('store/genre.json')

    genre_store = begin
      JSON.parse(File.read('store/genre.json'))
    rescue StandardError
      []
    end
    genre_load = genre_store.map { |genre| Genre.new(genre['name']) }
    @genres.concat(genre_load) unless genre_load.empty?
  end
end
