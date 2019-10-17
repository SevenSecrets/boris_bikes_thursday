require './lib/Bike'
class DockingStation
  attr_reader :bike_rack
  DEFAULT_CAPACITY = 20
  
  def initialize
    @bike_rack = []
 end

  def release_bike
    raise "No bikes available" if empty?
    @bike_rack.pop
  end

    def dock(bike)
      raise "Docking station full" if full?
      @bike_rack << bike
    end

private
  def full?
     if @bike_rack.length >= DEFAULT_CAPACITY
       true
     else
       false
     end
  end

  def empty?
    if @bike_rack.empty?
      true
    else
      false
    end
  end
end
