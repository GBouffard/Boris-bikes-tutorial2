require 'van'

describe Van do
  let(:van) { Van.new }
  let(:broken_bike) { double :bike, working: false }
  let(:working_bike) { double :bike, working: true }
  let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike] }
  it 'can have a default capacity' do
    expect(van.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    van2 = Van.new(10)
    expect(van2.capacity).to eq 10
  end

  it 'can load a bike' do
    van.load(:broken_bike)
    expect(van.loaded_bikes).to eq [:broken_bike]
  end

  it 'should be able to collect broken bikes from a station' do
    allow(ds).to receive(:release)
    van.collect_bikes_from(ds)
    expect(van.loaded_bikes).to eq [broken_bike]
    # need to FRAME
  end

  xit 'should be able to remove broken bikes from a station when collecting' do
    allow(ds).to receive(:collect_bikes_from).with :bikes
    allow(ds).to receive(:release).with :bikes
    expect(ds.available_bikes).to eq [working_bike]
    van.collect_bikes_from(ds) # we need to put all the allows BEFORE
    # running the method for this to return something
    
    # ds.available_bikes
    # action done on the class docking station, with the class bike.
    # I didn't understand this at first. What it means is that we have a
    # ds, with a broken bike and working bike. We EXPECT the STATION to
    # release the bike; we expect something, an ACTION to happen on DS, not van
    # but it depends on a method that we run on van. That's why it's like that:
    # NEED TO FRAME / HAD TO LOOK

    # expect(ds).to receive(:remove).with bikes:
    # van.collect_bikes_from ds

    # Steve - SESSION 4, then I can look at modules.
    # Integration test - 6min
    # docking_station = double :docking_station, bikes: [bike, broken_bike]
    # expect(docking_station).to receive(:release).with broken_bike
    # van.collect_broken_bikes_from docking_station
    # #
  end

  xit 'should be able to drop of bikes to a garage' do
  end

  xit 'should remove bikes from self once dropped off' do
  end
end
