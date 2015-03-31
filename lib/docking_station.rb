class DockingStation
  attr_reader :capacity, :docked_bikes
  def initialize(cap = 20)
    @capacity = cap
    @docked_bikes = []
  end

  def empty?
    true
  end

  def dock bike
    @docked_bikes << bike
  end
end
