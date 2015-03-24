require_relative 'ship'

class Board
  attr_reader :location

  def initialize
    @location = { A1: 'w', A2: 'w', A3: 'w', A4: 'w', A5: 'w' }
  end

  def place(ship, spot)
    fail 'can\'t place ship beyond board' unless off_board?(spot)
    fail 'ship already there' if spot_with_ship?(spot)
    @location[spot] = ship
    next_position(ship, spot) unless ship.size == 1
  end

  def next_position(ship, spot)
    array = @location.keys
    index = array.index(spot)
    new_spot = index + 1
    new_key = array[new_spot]
    @location[new_key] = ship
    # m = @location.keys[1+1]
    # @location[m]
    # location.keys -->l returns array
    # array.index --> get value  // take spot, get spots index
    # do index + 1
    # pass array new index
    # have new index, use it in hash
  end

  def hit!(spot)
    fail 'locations off the board cannot be hit' unless off_board?(spot)
    fail ' already hit ?' if already_hit?(spot)

    # @location[spot] = @location[spot].hit

    spot_with_ship?(spot) ? hit_ship(spot) : hit_water(spot)
  end

  def off_board? spot
    @location.key?(spot)
  end

  def already_hit? spot
    @location[spot] == 'x' || @location[spot] == 'o'
  end

  def spot_with_ship? spot
    !@location[spot].is_a? String
  end

  def all_hits
    @location.select { |_key, value| value == 'x' || value == 'o' }
  end

  def hit_ship(spot)
    @location[spot].sink!
    @location[spot] = 'x'
  end

  def hit_water(spot)
    @location[spot] = 'o'
  end
end
