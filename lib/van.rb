class Van
  attr_reader :capacity, :loaded_bikes
  def initialize(cap = 20)
    @capacity = cap
    @loaded_bikes = []
  end

  def collect_bikes_from(station)
    station.bikes.each do |bike|
      #     ^ @bikes is an array/method in Docking_station.rb
      # we iterrate through that collection on bikes with each.
      # no need to allow because we defined bikes: in the double ds.
      station.release(bike) unless bike.working
      #       ^ @bikes is an array in Docking_station.rb
      # but in that case, we need we need to allow the ds double to
      # receive the :release method. Then, the iteration works.
      load(bike) unless bike.working
      # ^ no need to allow anything on bike. It's an internal method of Van.
    end
    # MY MISTAKE AT FIRST I WAS USING station.release(bike)
    # outside of the do..end loop. bike was not being recognized.
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
