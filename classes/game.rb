require_relative './item'

class Game < Item
    def initialize(publish_date, multiplayer, last_played_at)
        super(publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?()
        super && Time.now.year - Date.parse(@last_played).year > 2
    end
end