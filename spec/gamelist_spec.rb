require_relative '../classes/gamelist'
require 'rspec'
require 'json'

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

describe GameList do
  let(:game_list) { GameList.new }

  before do
    game_list.games = []
    game_list.authors = []
  end

  describe '#save_game' do
    it 'saves the games to a JSON file' do
      test_game = Game.new('2023-06-01', '1', '2023-05-30')
      game_list.games << test_game

      expected_json = JSON.pretty_generate([test_game.to_hash])

      expect(File).to receive(:write).with('store/games.json', expected_json)

      game_list.save_game
    end
  end

  describe '#save_author' do
    it 'saves the authors to a JSON file' do
      test_author = Author.new('John', 'Doe')
      game_list.authors << test_author

      expected_json = JSON.pretty_generate([test_author.to_hash])

      expect(File).to receive(:write).with('store/authors.json', expected_json)

      game_list.save_author
    end
  end
end
