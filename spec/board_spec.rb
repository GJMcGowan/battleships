require 'board'

describe Board do
  it 'can place a ship on board location' do
    ship = double :ship
    expect(subject.place(ship)).to eq [ship]
  end
end
