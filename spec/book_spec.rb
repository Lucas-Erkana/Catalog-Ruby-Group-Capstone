require_relative '../classes/book'

RSpec.describe Book do
  before(:each) do
    @book = Book.new('06/06/2023', 'Lucas', 'Good')
  end

  it 'should initialize an instance of Book class' do
    expect(@book).to be_instance_of(Book)
  end

  it 'should have the correct publisher' do
    expect(@book.publisher).to eq('Lucas')
  end

  it 'should have the correct publication date' do
    expect(@book.publish_date).to eq('06/06/2023')
  end

  it 'should have the correct cover state' do
    expect(@book.cover_state).to eq('Good')
  end
end
