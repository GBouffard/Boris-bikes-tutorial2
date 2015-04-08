require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike, working: true }
  it 'can have a default capacity' do
    expect(subject.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    ds2 = DockingStation.new(50)
    expect(ds2.capacity).to eq 50
  end

  it 'has no bikes when created' do
    expect(subject).to be_empty
  end

  it 'dock bikes' do
    subject.dock bike
    expect(subject.bikes).to eq [bike]
  end

  it 'raises an error when you re not docking a bike' do
    not_a_bike = double :bike, working: 'not_a_bike'
    allow(not_a_bike).to receive(:working).and_return 'not_a_bike'
    expect { subject.dock not_a_bike }.to raise_error 'This is not a bike!'
  end

  it 'knows it has working bikes' do
    # MY MISTAKE HERE WAS TO NOT USE A LET FOR DOCKING STATION DOUBLE
    # Sam sugested I could use subject, or a double.
    # Failure/Error: Double was originally created in one example but has
    # leaked into another example and can no longer be used.
    # rspec-mocks' doubles are designed to only last for one example,
    # and you need to create a new one in each example.
    broken_bike = double :bike, working: false
    subject.dock(bike)
    subject.dock(broken_bike)
    expect(subject.available_bikes).to eq [bike]
  end

  it 'can release a bike' do
    subject.dock bike
    subject.release bike
    expect(subject.bikes).to eq []
  end
end
