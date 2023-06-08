require_relative '../classes/list_game'
require 'rspec'

describe GameList do
  it 'It should return author' do
    @author = [{ id: 1, first_name: 'Jane', last_name: 'Doe' }, { id: 1, first_name: 'Jane', last_name: 'Doe' }]
    expect(@author[1][:first_name]).to eql('Jane')
  end

  it 'It should return game' do
    @game = [{ id: 0, last_played_at: '2022-03-23', multiplayer: '1', publish_date: '2021-12-01' },
             { id: 1, last_played_at: '2023-11-23', multiplayer: '0', publish_date: '2023-01-31' }]
    expect(@game[1][:multiplayer]).to eql('0')
  end
end
