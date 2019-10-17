require 'docking_station'
require 'Bike'

describe DockingStation do
  dockingstation = DockingStation.new

  it 'responds to the release_bike method' do
    expect(dockingstation).to respond_to(:release_bike)
  end

  it 'checks docking station returns a bike' do
    full_station_1 = DockingStation.new
    full_station_1.dock(Bike.new)
    expect(full_station_1.release_bike).to be_instance_of(Bike)
  end

  it 'checks whether bike is working' do
    full_station_2 = DockingStation.new
    full_station_2.dock(Bike.new)
    test_bike = full_station_2.release_bike
    expect(test_bike.working?).to eq true
  end

  it 'responds to dock method' do
    expect(dockingstation).to respond_to(:dock)
  end

  it 'check docking station docks bike' do
    test_bike2 = Bike.new
    dockingstation.dock(test_bike2)
    expect(dockingstation.bike_rack).to eq [test_bike2]
  end

  it "fails to release bike if docking station is empty" do
    empty_station = DockingStation.new
    expect{empty_station.release_bike}.to raise_exception(RuntimeError,
      "No bikes available")
  end

  it "fails to dock a bike if capacity of 20 is reached" do
    full_station = DockingStation.new
    # p full_station::DEFAULT_CAPACITY
    DockingStation::DEFAULT_CAPACITY.times {full_station.dock(Bike.new)}
    expect{full_station.dock(Bike.new)}.to raise_exception(RuntimeError, "Docking station full")
  end

  it "on initialization create a docking station with non-default capacity" do
    non_default_station = DockingStation.new(10)
    expect(non_default_station.capacity).to eq(10)
  end

  it "on initialization creates a docking station with default capacity" do
    default_station = DockingStation.new
    expect(default_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

end
