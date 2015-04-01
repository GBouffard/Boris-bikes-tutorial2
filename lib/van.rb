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
    station.bikes.each { |bike| load(bike) unless bike.working }
  end
end
