class DockingStation
  attr_reader :capacity
  def initialize(cap = 20)
    @capacity = cap
  end

  def empty?
    true
  end
end
