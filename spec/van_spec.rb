require 'van'

describe Van do
  van = Van.new
  let(:broken_bike) { double :bike, working: false }
  let(:working_bike) { double :bike, working: true }
  it 'can have a default capacity' do
    expect(van.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    van2 = Van.new(10)
    expect(van2.capacity).to eq 10
  end

  it 'can load a bike' do
    van.load('broken_bike')
    expect(van.loaded_bikes).to eq ['broken_bike']
  end

  it 'should be able to collect broken bikes from a station' do
    # add to create van2, because van2.loaded_bikes was eq
    # to ['borken_bike' (from above), and object broken_bike(below)]
    # WHY ??
    van2 = Van.new
    ds = double :dockingStation, bikes: [broken_bike]
    allow(ds).to receive(:collect_bikes_from).with bikes:
    van2.collect_bikes_from(ds)
    expect(van2.loaded_bikes).to eq [broken_bike]
  end

  xit 'should be able to remove broken bikes from a station when collecting' do
  end

  xit 'should be able to drop of bikes to a garage' do
  end

  xit 'should remove bikes from self once dropped off' do
  end
end
