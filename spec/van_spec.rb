require 'van'

describe Van do
  let(:van) { Van.new }
  let(:broken_bike) { double :bike, working: false }
  let(:working_bike) { double :bike, working: true }
  let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike] }
  let(:garage) { double :garage }
  # DOUBLES
  # The only thing we give to doubles are methods that returns values when
  # called. It's part of the doubles.

  # let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike]
  # ds.bikes or calling bikes from ds corresponds to [broken_bike, working_bike]
  # it works when we do station.bikes, since we use the double ds as argument
  #
  # same thing for broken_bike; when working is called:, it returns false.

  it 'can have a default capacity' do
    expect(van.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    van2 = Van.new(10)
    expect(van2.capacity).to eq 10
  end

  it 'can load a bike' do
    # always with :symbol
    van.load(:broken_bike)
    expect(van.loaded_bikes).to eq [:broken_bike]
  end

  it 'should be able to collect broken bikes from a station' do
    allow(ds).to receive(:release)
    # in that test, :release is just allowed. It doesn't do anything.
    van.collect_bikes_from(ds)
    expect(van.loaded_bikes).to eq [broken_bike]
  end

  # INTEGRATION TEST vs UNIT TESTS
  it 'should be able to remove broken bikes from a station when collecting' do
    # This test is the one I wanted to do in the first place and it makes
    # perfect sense.
    #
    # expect(ds.bikes).to eq [working_bike]
    #
    # HOWEVER, it's bound to fail: the state of a double CANNOT CHANGE!
    # ds.bikes will always corresponds to [broken_bike, working_bike]
    # We need to think another way and to do that, we just chech that the
    # release method on ds works. We use a expect to check that it does.
    expect(ds).to receive(:release)
    van.collect_bikes_from(ds)
    # Also, the order of things is important. we need to have the allows and
    # expects on doubles running before we call the methods
  end

  xit 'should be able to drop off bikes to a garage' do
    # test cannot be done before all units test are done. Didn't do garage.
    van.load(:broken_bike)
    expect(garage).to receive [:transfer]
    van.transfer(:broken_bike)
  end

  xit 'should remove bikes from self once dropped off' do
  end
end
