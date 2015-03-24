require 'board'
require 'capybara/rspec'

feature 'board can place a ship' do
  let(:board) { Board.new }
  let(:ship1) { Ship.new }
  scenario 'ship can be created and placed on board' do
    expect(board.place(ship1, :A2)).to eq ship1
  end

  scenario 'board can place ship only on existing spot' do
    expect do
      board.place(ship1, :A6)
    end.to raise_error 'can\'t place ship beyond board'
  end

  scenario 'board can place more than one ship' do
    board.place(ship1, :A1)
    ship2 = Ship.new
    board.place(ship2, :A4)
    expect(board.location[:A1]).to eq ship1
    expect(board.location[:A4]).to eq ship2
  end

  scenario 'ships can be hit' do
    board.place(ship1, :A1)
    board.hit!(:A1)
    expect(board.location[:A1]).to eq 'x'
  end

  scenario 'ships can be missed' do
    board.hit!(:A1)
    expect(board.location[:A1]).to eq 'o'
  end

  scenario 'location was already hit to raise error ' do
    board.hit!(:A1)
    expect { board.hit!(:A1) }.to raise_error ' already hit ?'
  end

  scenario 'locations not on the board cannot be hit' do
    expect do
      board.hit!(:A6)
    end.to raise_error 'locations off the board cannot be hit'
  end

  scenario 'returns all hit locations on the board' do
    board.place(ship1, :A3)
    board.hit!(:A3)
    board.hit!(:A4)
    board.hit!(:A5)
    expect(board.all_hits).to eq(A3: 'x', A4: 'o', A5: 'o')
  end

  scenario ' ship can not be placed where a ship is already present' do
    board.place(ship1, :A3)
    expect { board.place(ship1, :A3) }.to raise_error 'ship already there'
  end

  scenario 'ship will take up as many points as its size' do
    ship2 = Ship.new
    ship2.frigate
    board.place(ship2, :A2)
    expect(board.location[:A2]).to eq ship2
    expect(board.location[:A3]).to eq ship2
  end
end
