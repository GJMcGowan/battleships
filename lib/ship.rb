# class Ship
#   attr_accessor :size
#   def initialize(_arg)
#     @size = 1
#   end
# end

class Ship
  attr_reader :sunk
  attr_reader :size

  def initialize
    @sunk = false
    @size = 1
  end

  def sink!
    @sunk = true
  end

  def battleship
    @size = 4
  end

  def destroyer
    @size = 3
  end

  def frigate
    @size = 2
  end
end
