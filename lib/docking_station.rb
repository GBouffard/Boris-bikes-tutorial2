class DockingStation
  attr_reader :capacity, :docked_bikes
  def initialize(cap = 20)
    @capacity = cap
    @docked_bikes = []
  end

  def empty?
    true
  end

  def dock(bike)
    # bike.working ==(true || false) didn't work. Ask teacher.
    if bike.working == true || bike.working == false
      @docked_bikes << bike
    else
      fail 'This is not a bike!'
    end
    @docked_bikes
  end

  def available_bikes
    @docked_bikes.select(&:working)
  end

  def release(bike)
    @docked_bikes.pop
  end
end
