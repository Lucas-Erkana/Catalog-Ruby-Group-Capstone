require_relative 'item'

class Game < Item
  attr_reader :id, :publish_date
  attr_accessor :last_played_at, :multiplayer

  def initialize(last_played_at, multiplayer, publish_date, id: Random.rand(1..1000))
    super(publish_date)
    @id = id
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super || Date.today > Date.iso8601(@last_played_at).next_year(2)
  end

  def to_hash
    {
      id: @id,
      last_played_at: @last_played_at,
      multiplayer: @multiplayer,
      publish_date: @publish_date
    }
  end
end
