require 'bike'

describe Bike do
  bike = Bike.new
  it 'knows that it is working' do
    expect(bike.working).to be true
  end

  it 'can break' do
    bike.break!
    expect(bike.working).to be false
  end

  xit 'can be fixed once broken' do
  end

  xit 'cannot be fixed if it is already working' do
  end
end
