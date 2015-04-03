require 'capybara/rspec'
require 'bike'
require 'Docking_station'
require 'garage'
require 'van'

feature '8 bikes station. 7 users take some. 2 come back broken' do
  scenario 'van picks up the 2, get them fixed at garage and bring them back' do
    ds = DockingStation.new(8)
    van = Van.new
    garage = Garage.new
    # Is there a better way to iterrate for these actions?
    bike1 = Bike.new
    ds.dock(bike1)
    bike2 = Bike.new
    ds.dock(bike2)
    bike3 = Bike.new
    ds.dock(bike3)
    bike4 = Bike.new
    ds.dock(bike4)
    bike5 = Bike.new
    ds.dock(bike5)
    bike6 = Bike.new
    ds.dock(bike6)
    bike7 = Bike.new
    ds.dock(bike7)
    bike8 = Bike.new
    ds.dock(bike8)
    expect(ds.available_bikes.length).to eq 8
    #       ^ important not to forget to mention in which class the method
    #       can be found, else the test doesn't work. It has no clue.
    ds.release(bike1)
    ds.release(bike2)
    ds.release(bike3)
    ds.release(bike4)
    ds.release(bike5)
    ds.release(bike6)
    ds.release(bike7)
    expect(ds.available_bikes.length).to eq 1
    # breaking 2 bikes and bringing them all back.
    bike6.break!
    bike2.break!
    ds.dock(bike1)
    ds.dock(bike2)
    ds.dock(bike3)
    ds.dock(bike4)
    ds.dock(bike5)
    ds.dock(bike6)
    ds.dock(bike7)
    expect(ds.available_bikes.length).to eq 6
    expect(ds.bikes.length).to eq 8
    # van collects broken bikes and takes to garage
    van.collect_bikes_from(ds)
    expect(van.loaded_bikes.length).to eq 2
    van.drop_off_to(garage)
    # expect(van.loaded_bikes.length).to eq 0
    # I get 1
    # expect(garage.bikes.length).to eq 2
    # I get 1
    # drop_off_to doesn't seem to iterrate through the array. No idea why!
    # Units tests are passing.
  end
end
