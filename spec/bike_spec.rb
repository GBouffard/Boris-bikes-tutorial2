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

  it 'can be fixed once broken' do
    bike.break!
    bike.fix!
    expect(bike.working).to be true
  end

  it 'cannot be fixed if it is already working' do
    bike.break!
    bike.fix!
    expect { bike.fix! }.to raise_error 'bike already working'
  end
end
