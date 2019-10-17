require './lib/Bike'
class DockingStation
  attr_reader :bike_rack
  def initialize
    @bike_rack = []
 end

  def release_bike
    if @bike_rack.empty?
      raise "Docking Station is empty"
    else
      @bike_rack.pop
    end
  end

  def dock(bike)
    @bike_rack << bike
  end
end
