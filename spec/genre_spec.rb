require_relative '../classes/genre'

describe Genre do
  it 'Should create an instance of the Genre class' do
    genre = Genre.new('Fictional')
    expect(genre).to be_instance_of Genre
  end
end
