class DockingStation
  attr_reader :capacity, :bikes
  attr_writer :loaded_bikes
  def initialize(cap = 20)
    @capacity = cap
    @bikes = []
  end

  def empty?
    true
  end

  def dock(bike)
    # bike.working ==(true || false) didn't work. Ask teacher.
    if bike.working == true || bike.working == false
      @bikes << bike
    else
      fail 'This is not a bike!'
    end
    @bikes
  end

  def available_bikes
    @bikes.select(&:working)
  end

  def release(bike)
    @bikes.delete bike
  end
end
