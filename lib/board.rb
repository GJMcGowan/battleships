require_relative 'ship'

class Board
  attr_reader :location

  def initialize
    @location = [0, 1, 2]
  end

  def place(ship, spot)
    @location[spot] = ship
  end

  def hit!(spot)
    fail ' already hit ?' if @location[spot] == 'x'
    @location[spot].sink! unless @location[spot].is_a? Integer
    @location[spot] = 'x'
  end
end
