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

  scenario 'ships can have a size' do
    expect(subject.size).to eq 1
  end

  scenario 'ships can be different types, with different sizes' do
    subject.battleship
    expect(subject.size).to eq 4
  end
end
