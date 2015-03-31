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
    if bike.working == true || bike.working == false
      @docked_bikes << bike
    else
      fail 'This is not a bike!'
    end
  end
end
