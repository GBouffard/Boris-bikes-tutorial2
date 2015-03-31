require 'Docking_station'

describe DockingStation do
  ds = DockingStation.new
  it 'can have a default capacity' do
    expect(ds.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    ds2 = DockingStation.new(50)
    expect(ds2.capacity).to eq 50
  end

  it 'has no bikes when created' do
    expect(ds).to be_empty
  end

  it 'dock bikes' do
    bike = double :bike, working: true
    ds.dock bike
    expect(ds.docked_bikes).to eq [bike]
  end

  it 'raises an error when you re not docking a bike' do
    bike = double :bike, working: 'yo'
    allow(bike).to receive(:working).and_return 'yo'
    expect { ds.dock bike }.to raise_error 'This is not a bike!'
  end

  xit 'knows it has working bikes' do
  end

  xit 'can release a bike' do
  end
end
