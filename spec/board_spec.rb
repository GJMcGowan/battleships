require 'board'

describe Board do
  it 'can place a ship on board location' do
    ship = double :ship
    allow(ship).to receive(:size) { 1 }
    subject.place(ship, :A2)
    expect(subject.location).to eq(A1: 'w', A2: ship, A3: 'w', A4: 'w', A5: 'w')
  end
  it { is_expected.to respond_to :hit! }

  it 'can place a size 2 ship on board location' do
    ship = double :ship, size: 2
    subject.place(ship, :A2)
    board_state = { A1: 'w', A2: ship, A3: ship, A4: 'w', A5: 'w' }
    expect(subject.location).to eq(board_state)
  end

  it 'can get next position' do
    # expect(subject.next_position(:A1)).to eq :A2
    ship = double :ship
    allow(ship).to receive(:size).and_return 2
    subject.place(ship, :A3)
    expect(subject.location).to eq(A1: 'w', A2: "w", A3: ship, A4: ship, A5: 'w')
  end

  # it 'can get next position again' do
  #  expect(subject.next_position(:A2)).to eq :A3
  # end
end
