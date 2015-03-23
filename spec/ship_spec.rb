require 'ship'

describe Ship do
  it 'can return its size' do
    expect(subject.size).to eq 1
  end

  it 'can allow user to select size' do
    subject.size = (3)
    expect(subject.size).to eq 3
  end

  it 'can allow use to select a ship' do
    ship = subject('battleship')
    expect { ship.size }.to eq 4
  end
end
