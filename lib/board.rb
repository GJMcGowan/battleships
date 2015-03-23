class Board
  def initialize
    @location = []
  end

  def place(ship)
    @location << ship
  end
end
