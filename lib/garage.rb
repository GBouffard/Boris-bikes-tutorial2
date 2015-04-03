class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def dock(bike)
    @bikes << bike
  end

  def fix_a_bike(bike)
    bike.fix!
  end
  # MY MISTAKE AT FIRST: I was trying this to change the bike status
  # def fix!
  #   bike.working = true
  # end
  # ONCE AGAIN THE STATUS OF A DOUBLE DOESN'T CHANGE.
  # @working can only be changed in the bike class.
  def release(bike)
    @bikes.delete bike
  end
end
