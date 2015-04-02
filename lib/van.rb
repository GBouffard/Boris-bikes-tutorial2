class Van
  attr_reader :capacity, :loaded_bikes
  def initialize(cap = 20)
    @capacity = cap
    @loaded_bikes = []
  end

  def load(bike)
    @loaded_bikes << bike
  end

  def collect_bikes_from(station)
    # @bikes is an instance variable in docking_station, an array.
    # with the double :ds, we have defined bikes:
    station.bikes.each do |bike|
      station.release(bike) unless bike.working
      # release(bike) is a method in docking_station.rb
      # so when we allow(ds).to receive(:release), the iteration through
      # bikes work
      load(bike) unless bike.working
    end
    # MY MISTAKE AT FIRST I WAS USING station.release(bike)
    # outside of the do..end loop so my method was not recognizing
    # bike
  end
end
