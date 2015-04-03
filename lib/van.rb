class Van
  attr_reader :capacity, :loaded_bikes
  def initialize(cap = 20)
    @capacity = cap
    @loaded_bikes = []
  end

  def collect_bikes_from(station)
    # @bikes is an instance variable in docking_station, an array.
    # that's actually why we call it station.bikes and station is the
    # argument of the method.
    station.bikes.each do |bike|
      station.release(bike) unless bike.working
      # release(bike) is a method in docking_station.rb, so
      # we write it as station.release(bike)
      # we need to allow the double of ds ds to actually receive(:release)
      # then, the iteration works.
      load(bike) unless bike.working
      # no need to allow anything on bike. It's an internal method of Van.
    end
    # MY MISTAKE AT FIRST I WAS USING station.release(bike)
    # outside of the do..end loop so my method was not recognizing
    # bike
  end

  def collect_fixed_bikes_from(garage)
    garage.bikes.each do |bike|
      garage.release(bike) if bike.working
      load(bike) if bike.working
    end
  end

  def load(bike)
    @loaded_bikes << bike
  end

  def drop_off_to(location)
    location.bikes.each do |bike|
      location.dock(bike)
      release(bike)
    end
  end

  def release(bike)
    @loaded_bikes.delete(bike)
  end
end
