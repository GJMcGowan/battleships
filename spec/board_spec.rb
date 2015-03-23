require 'board'

describe Board do
  it 'can place a ship on board location' do
    ship = double :ship
    expect(subject.place(ship, 0)).to eq ship
  end
  it { is_expected.to respond_to :hit! }
end
