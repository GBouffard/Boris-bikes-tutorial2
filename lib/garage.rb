class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
    bike.fix!
    release(bike)
  end
  # MY MISTAKE: I was trying this to change the bike status
  # def fix!
  #   bike.working = true
  # end
  # with a method in the Garage class. The working status of bike
  # has to be changed in the Bike class, where we already have a
  # fix! method. Pretty convenient.
  def release(bike)
    @bikes.delete bike
  end
end
