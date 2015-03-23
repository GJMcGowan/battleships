class Ship
  attr_accessor :size
  def initialize(arg)
    if arg == 'battleship'
      @size = 4
    else
      @size = 3
    end
  end
end
