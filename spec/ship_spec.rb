require 'ship'

describe Ship do
  it 'when created it\'s floating' do
    expect(subject.sunk).to eq false
  end

  it 'not floating when hit' do
    subject.sink!
    expect(subject.sunk).to eq true
  end

  it 'can be a battleship' do
    subject.battleship
    expect(subject.size).to eq 4
  end
end
