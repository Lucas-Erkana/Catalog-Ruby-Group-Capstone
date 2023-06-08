require_relative '../classes/list_music'

describe MusicList do
  it 'It should return album' do
    @album = [{ id: 100, publish_date: '2023-04-07', on_spotify: true },
              { id: 120, publish_date: '2023-12-12', on_spotify: true }]
    expect(@album[1][:publish_date]).to eql('2023-12-12')
  end

  it 'It should return genre' do
    @genre = [{ name: 'Rock' }, { name: 'Pop' }]
    expect(@genre[1][:name]).to eql('Pop')
  end
end
