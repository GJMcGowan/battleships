require 'ship'

describe Ship do
  it 'when created it\'s floating' do
    expect(subject.sunk).to eq false
  end

  it 'not floating when hit' do
    subject.sink!
    expect(subject.sunk).to eq true
  end

  # xit 'can return its size' do
  #   ship = Ship.new 'frigate'
  #   expect(ship.size).to eq 2
  # end

  # it 'can allow user to select size' do
  #   subject.size = (3)
  #   expect(subject.size).to eq 3
  # end

  # xit 'can allow user to select a ship' do
  #   ship = Ship.new 'battleship'
  #   expect(ship.size).to eq 4
  # end

  # xit 'will raise an error if wrong ship type is selected' do
  #   expect { Ship.new('horse') }.to raise_error 'Invalid Ship Type'
  # end
end
