require 'garage'

describe Garage do
  let(:garage) { Garage.new }
  let(:bike_to_fix) { double :bike, working: false }

  it 'can dock a bike' do
    garage.dock(:bike_to_fix)
    expect(garage.bikes).to eq [:bike_to_fix]
  end

  it 'fixes a bike once docked' do
    garage.dock(bike_to_fix)
    # we cannot check bike.working = true as it's a state in the bike class.
    # A double doesn't change its state, so we checks that bike receives fix!
    expect(bike_to_fix).to receive(:fix!)
    garage.fix_a_bike(bike_to_fix)
    # I HAD AN ERROR AT FIRST : can't define Singleton
    # an allow or expect CANNOT be done on a Symbol. expect(:bike_to_fix)
    # didn't work. It has to be on the object itself, so expect(bike_to_fix)
  end
  it 'releases a bike once fixed' do
    garage.dock(bike_to_fix)
    allow(bike_to_fix).to receive(:fix!)
    garage.fix_a_bike(bike_to_fix)
    garage.release(bike_to_fix)
    expect(garage.bikes).to eq []
  end
end
