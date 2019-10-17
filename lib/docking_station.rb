require './lib/Bike'
class DockingStation
  attr_reader :bike_rack
  def initialize
    @bike_rack = []
    @capacity = 1
 end

  def release_bike
    raise "Docking Station is empty" if @bike_rack.empty?
    @bike_rack.pop
  end

  def dock(bike)
    raise "Capacity reached" if @bike_rack.length >= @capacity
    @bike_rack << bike
  end
end
