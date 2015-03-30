require 'bike'

describe Bike do
  bike = Bike.new
  it "knows that it is working" do
    expect(bike).to be_working
  end

  xit "can break" do
  end

  xit "can be fixed once broken" do
  end

  xit 'cannot be fixed if it is already working' do
  end

end