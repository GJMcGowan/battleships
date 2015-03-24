require 'board'
require 'capybara/rspec'

feature Ship do
  scenario 'when ship is hit it sinks' do
    ship = Ship.new
    board = Board.new
    board.place(ship, :A2)
    board.hit!(:A2)

    expect(ship.sunk).to eq true
  end
end
