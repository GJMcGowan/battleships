require 'board'
require 'capybara/rspec'

feature 'board can place a ship' do
  scenario 'ship can be created and placed on board' do
    board = Board.new
    ship = Ship.new
    expect(board.place(ship, 0)).to eq ship
  end

  scenario 'board can place more than one ship' do
    board = Board.new
    ship1 = Ship.new
    board.place(ship1, 0)
    ship2 = Ship.new
    board.place(ship2, 2)
    expect(board.location).to eq [ship1, 1, ship2]
  end

  scenario 'location can be hit' do
    board = Board.new
    board.hit!(1)
    expect(board.location[1]).to eq 'x'
  end

  scenario 'location was already hit to raise error ' do
    board = Board.new
    board.hit!(1)
    expect { board.hit!(1) }.to raise_error ' already hit ?'
  end

  # scenario 'ship can be sunk' do
  #   board = Board.new
  #   ship = Ship.new
  #   board.place(ship, 0)
  #   board.hit!(0)
  #   expect(board.location).to be nil
  # end
end
