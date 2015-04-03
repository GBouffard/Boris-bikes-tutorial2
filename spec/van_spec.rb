require 'van'

describe Van do
  let(:van) { Van.new }
  let(:broken_bike) { double :bike, working: false }
  let(:working_bike) { double :bike, working: true }
  let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike] }
  let(:garage) { double :garage, bikes: [broken_bike, working_bike] }
  # DOUBLES
  # The only thing we give to doubles are methods that returns values when
  # called. It's part of the doubles.

  # let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike]
  # ds.bikes or calling bikes from ds corresponds to [broken_bike, working_bike]
  # it works when we do station.bikes, since we use the double ds as argument
  #
  # another point is that bikes: need to point to the doubles, not as symbols
  # else tests won't work.
  # let(:garage) { double :garage, bikes: broken_bike }
  # NOT let(:garage) { double :garage, bikes: :broken_bike }
  #
  # if we want to iterrate over it, like done with each, it needs to be in an
  # array. let(:garage) { double :garage, bikes: [broken_bike] }
  #
  # for true and false, its simply
  # let(:broken_bike) { double :bike, working: false }

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

  # All the simple unit tests need to be done before we move to integrations.

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

  it 'should be able to drop off bikes to a garage' do
    # for the 2 drop offs test, we won't care if bikes are working or not.
    # we will test that it drops off what's in there.
    van.load(working_bike)
    van.load(broken_bike)
    2.times { expect(garage).to receive(:dock) }
    van.drop_off_to(garage)
  end

  it 'should remove bikes from self once dropped off' do
    van.load(broken_bike)
    allow(garage).to receive(:dock)
    van.drop_off_to(garage)
    expect(van.loaded_bikes).to eq []
  end

  it 'should be able to drop off fixed bikes to a station' do
    van.load(working_bike)
    van.load(broken_bike)
    2.times { expect(ds).to receive(:dock) }
    van.drop_off_to(ds)
  end

  it 'should be able to collect fixed bikes from a garage' do
    van.load(working_bike)
    expect(garage).to receive(:release)
    van.collect_fixed_bikes_from(garage)
  end
end
