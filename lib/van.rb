class Van
  attr_reader :capacity, :loaded_bikes
  def initialize(cap = 20)
    @capacity = cap
    @loaded_bikes = []
  end

  def collect_bikes_from(station)
    station.bikes.each do |bike|
      #     ^ @bikes is an array/method in docking_station.rb
      # we iterrate through that collection on bikes with each.
      # no need to allow because we defined bikes: in the double ds.
      station.release(bike) unless bike.working
      #       ^ release is a method in docking_station.rb
      # but we didn't define a returned value of release: in the ds double.
      # so we need to allow the double to receive the real :release method.
      load(bike) unless bike.working
      # ^ no need to allow anything in here. It's not done on another class.
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
    @loaded_bikes.each do |bike|
      location.dock(bike)
      release(bike)
    end
  end

  def release(bike)
    @loaded_bikes.delete(bike)
  end
end
