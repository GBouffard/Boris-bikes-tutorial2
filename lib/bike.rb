class Bike
  attr_reader :working
  def initialize
    @working = true
  end

  def break!
    @working = false
  end
end
