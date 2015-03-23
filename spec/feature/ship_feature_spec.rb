require 'board'
require 'capybara/rspec'

feature Ship do
  scenario 'when ship is hit it sinks' do
    ship = Ship.new
    board = Board.new
    board.place(ship, 0)
    board.hit!(0)

    expect(ship.sunk).to eq true
  end
end
