require_relative '../classes/music_album'
require_relative '../classes/item'
require 'date'

describe MusicAlbum do
  it 'Should create an instance of the MusicAlbum class' do
    date = Date.parse '2023/03/10'
    musicalbum = MusicAlbum.new(true, date)
    expect(musicalbum).to be_instance_of MusicAlbum
  end

  it 'can_be_archived? method should return true' do
    musicalbum = MusicAlbum.new(true, '1990/03/01')
    expect(musicalbum.publish_date).to eq('1990/03/01')
    expect(musicalbum.can_be_archived?).to be true
  end

  it 'can_be_archived? method should return false' do
    musicalbum = MusicAlbum.new(true, '2023/05/29')
    expect(musicalbum.publish_date).to eq('2023/05/29')
    expect(musicalbum.can_be_archived?).to be false
  end
end
