# class Ship
#   attr_accessor :size
#   def initialize(_arg)
#     @size = 1
#   end
# end

class Ship
  attr_reader :sunk

  def initialize
    @sunk = false
  end

  def sink!
    @sunk = true
  end
  # def initialize# (arg)
  #   # if arg == 'battleship'
  #   #   @size = 4
  #   # elsif arg == 'destroyer'
  #   #   @size = 3
  #   # elsif arg == 'frigate'
  #   #   @size = 2
  #   # else
  #   #   fail 'Invalid Ship Type'
  #   # end
  #   @size = 1
  # end
end
