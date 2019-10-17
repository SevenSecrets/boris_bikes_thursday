require './lib/Bike'
class DockingStation
  attr_reader :bike_rack
  def initialize
    @bike_rack = []
    @capacity = 20
 end

  def release_bike
    raise "No bikes available" if @bike_rack.empty?
    @bike_rack.pop
  end

  def dock(bike)
    raise "Docking station full" if @bike_rack.length >= @capacity
    @bike_rack << bike
  end
end
