require 'van'

describe Van do
  # DOUBLES
  # The only thing we give to doubles are methods that returns values when
  # called. These methods are part of the double and CANNOT be changed.
  let(:van) { Van.new }
  let(:broken_bike) { double :bike, working: false }
  let(:working_bike) { double :bike, working: true }
  #                          no problem     ^  with true and false.
  let(:ds) { double :dockingStation, bikes: [broken_bike, working_bike] }
  #                                         ^   needs to be an array  ^
  # for all the arrays methods to work (we use .each). Plus in garage and ds
  # bikes are stored as arrays. Even if there was only 1, it'd have to be
  # an array like [broken_bike]. bikes: broken_bike wouldn't work.
  let(:garage) { double :garage, bikes: [broken_bike, working_bike] }
  #                               also   ^, broken_bike and NOT :broken_bike
  #                                      we cannot use symbols in there!

  it 'can have a default capacity' do
    expect(van.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    van2 = Van.new(10)
    expect(van2.capacity).to eq 10
  end

  it 'can load a bike' do
    # always with :symbol
    van.load(broken_bike)
    expect(van.loaded_bikes).to eq [broken_bike]
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
    # at first I wanted to test
    # expect(ds.bikes).to eq [working_bike]
    # and it's a logical test HOWEVER, it's bound to fail: the state of a double
    # CANNOT CHANGE! ds.bikes will always give [broken_bike, working_bike] as
    # defined in the let method. So we check that the release methods (that
    # remove bikes from a station) work when we collect and load in the van.
    expect(ds).to receive(:release)
    van.collect_bikes_from(ds)
    # Also, the order of things is important. we need to have the allows and
    # expects running on doubles running before we call the methods on the class
  end

  it 'should be able to drop off bikes to a garage' do
    # NB: for the 2 drop offs test, we won't care if bikes are working or not.
    van.load(working_bike)
    van.load(broken_bike)
    expect(garage).to receive(:dock)
    #                                   ^ :only indispensables on methods.
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
    expect(ds).to receive(:dock)
    van.drop_off_to(ds)
  end

  it 'should be able to collect fixed bikes from a garage' do
    van.load(working_bike)
    expect(garage).to receive(:release)
    van.collect_fixed_bikes_from(garage)
  end
end
