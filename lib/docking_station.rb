class DockingStation
  attr_reader :docked_bikes

  def release_bike
    return Bike.new
  end

  def dock(bike)
    @docked_bikes = bike
  end
end
