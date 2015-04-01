require 'Docking_station'

describe DockingStation do
  ds = DockingStation.new
  let(:bike) { double :bike, working: true }
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
    ds.dock bike
    expect(ds.docked_bikes).to eq [bike]
  end

  xit 'raises an error when you re not docking a bike' do
    not_a_bike = double :bike, working: 'not_a_bike'
    allow(not_a_bike).to receive(:working).and_return 'not_a_bike'
    expect { ds.dock not_a_bike }.to raise_error 'This is not a bike!'
  end

  xit 'knows it has working bikes' do
    # bike = double :bike, working: true
    # broken_bike = double :bike, working: false
    # expect(bike).to receive(:working).and_return true
    # expect(broken_bike).to receive(:working).and_return false
    # ds.dock bike
    # ds.dock broken_bike
    
    # Failure/Error: expect(ds.docked_bikes).to eq []
    # Double :bike was originally created in one example but has
    # leaked into another example and can no longer be used.
    # rspec-mocks' doubles are designed to only last for one example,
    # and you need to create a new one in each example you wish to
    # use it for ==> need to ask Sam.
    broken_bike = double :bike, working: false
    ds.dock(bike)
    ds.dock(broken_bike)
    expect(ds.available_bikes).to eq [bike]
  end

  xit 'can release a bike' do
    ds.dock bike
    ds.release bike
    expect(ds.docked_bikes).to eq []
  end
end
