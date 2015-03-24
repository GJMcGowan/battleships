require 'board'
require 'capybara/rspec'

feature 'board can place a ship' do
  scenario 'ship can be created and placed on board' do
    board = Board.new
    ship = Ship.new
    expect(board.place(ship, :A2)).to eq ship
  end

  scenario 'board can place ship only on existing spot' do
    board = Board.new
    ship1 = Ship.new
    expect { board.place(ship1, :A6) }.to raise_error 'can\'t place ship beyond board'
  end

  scenario 'board can place more than one ship' do
    board = Board.new
    ship1 = Ship.new
    board.place(ship1, :A1)
    ship2 = Ship.new
    board.place(ship2, :A4)
    expect(board.location[:A1]).to eq ship1
    expect(board.location[:A4]).to eq ship2
  end

  scenario 'location can be hit' do
    board = Board.new
    board.hit!(:A1)
    expect(board.location[:A1]).to eq 'x'
  end

  scenario 'location was already hit to raise error ' do
    board = Board.new
    board.hit!(:A1)
    expect { board.hit!(:A1) }.to raise_error ' already hit ?'
  end

  scenario 'locations not on the board cannot be hit' do
    board = Board.new
    expect { board.hit!(:A6) }.to raise_error 'locations off the board cannot be hit'
  end

  # scenario 'ship can be sunk' do
  #   board = Board.new
  #   ship = Ship.new
  #   board.place(ship, 0)
  #   board.hit!(0)
  #   expect(board.location).to be nil
  # end
end
