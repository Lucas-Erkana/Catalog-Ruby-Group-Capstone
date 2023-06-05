require_relative 'book'
require 'json'

class ListBook
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book
    puts 'Enter the book you want to add: '
    title = gets.chomp
    puts 'Enter the color of the book: '
    color = gets.chomp
    puts 'Enter the publish date of the book(Year-MM-DD): '
    publish_date = gets.chomp
    puts 'Enter the publisher of the book: '
    publisher = gets.chomp
    puts 'Enter the cover state of the book: '
    cover_state = gets.chomp
    book = Book.new(publish_date, publisher, cover_state)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    puts 'Book added'
    store_book(book)
  end

  def store_book(book)
    obj = {
      id: book.id,
      publisher: book.publisher,
      publish_date: book.publish_date,
      cover_state: book.cover_state
    }

    stored_book = File.empty?('store/books.json') ? [] : JSON.parse(File.read('store/books.json'))
    stored_book << obj
    File.write('store/books.json', stored_book.to_json)
  end

  def list_all_books
    @books = File.empty?('store/books.json') ? [] : JSON.parse(File.read('store/books.json'))
    @books.each do |book|
      puts "Publish date: #{book['publish_date']}, Publisher: #{book['publisher']}, Cover state: #{book['cover_state']}"
    end
  end
end
