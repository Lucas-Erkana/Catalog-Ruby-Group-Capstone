require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  before(:each) do
    @game = Game.new('2020-04-20', 3, '2023-12-05')
  end

  context 'When last played is greater than 2 years' do
    it 'should be able to be archived' do
      can_be_archived = @game.send(:can_be_archived?)
      expect(can_be_archived).to be true
    end
  end
end
