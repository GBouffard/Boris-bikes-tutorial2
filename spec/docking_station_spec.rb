require 'Docking_station'

describe Docking_station do
  ds = Docking_station.new
  it 'can have a default capacity' do
    expect(ds.capacity).to eq 20
  end

  it 'can have a custom capacity' do
    ds2 = Docking_station.new(50)
    expect(ds2.capacity).to eq 50
  end

  xit 'has no bikes when created' do
  end

  xit 'raises an error when you re not docking a bike' do
  end

  xit 'knows it has working bikes' do
  end

  xit 'can release a bike' do
  end
end
