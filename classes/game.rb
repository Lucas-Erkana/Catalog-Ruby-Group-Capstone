require_relative './item'
require 'date'

class Game < Item
  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    super || Date.today > Date.iso8601(@last_played_at).next_year(2)
  end
end
