require_relative 'ship'

class Board
  attr_reader :location

  def initialize
    @location = { A1: 'w', A2: 'w', A3: 'w', A4: 'w', A5: 'w' }
  end

  def place(ship, spot)
    fail 'can\'t place ship beyond board' unless @location.key?(spot)
    @location[spot] = ship
  end

  def hit!(spot)
    fail 'locations off the board cannot be hit' unless @location.key?(spot)
    fail ' already hit ?' if @location[spot] == 'x'
    @location[spot].sink! unless @location[spot].is_a? String
    @location[spot] = 'x'
  end
end
