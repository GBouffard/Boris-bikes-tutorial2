require 'garage'

describe Garage do
  let(:garage) { Garage.new }
  let(:bike) { double :bike, working: false }
  it 'fixes a bike once docked' do
    expect(bike).to receive(:fix!)
    # I HAD AN ERROR AT FIRST : can't define Singleton
    # an allow or expect CANNOT be done on a Symbol. allow(:bike) didn't work.
    # it has to be on the object itself, so allow(bike)
    garage.dock(bike)
    # shouldn't do 2 expects in a same test but it saves me some time right now.
    expect(garage.bikes).to eq []
  end
end
