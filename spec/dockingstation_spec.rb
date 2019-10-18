require 'docking_station'
require 'Bike'

describe DockingStation do
  dockingstation = DockingStation.new

  it 'responds to the release_bike method' do
    expect(dockingstation).to respond_to(:release_bike)
  end

  it 'checks docking station returns a bike' do
    full_station_1 = DockingStation.new
    full_station_1.dock(double(:bike))
    expect(full_station_1.release_bike).to eq(double(:bike))
  end

  it 'checks whether bike is working' do
    full_station_2 = DockingStation.new
    full_station_2.dock(double(:bike))
    test_bike = full_station_2.release_bike
    expect(test_bike.working?).to eq true
  end

  it 'responds to dock method' do
    expect(dockingstation).to respond_to(:dock)
  end

  it 'check docking station docks bike' do
    docked_bike = double(:bike)
    dockingstation.dock(docked_bike)
    expect(dockingstation.bike_rack).to eq([docked_bike])
  end

  it "fails to release bike if docking station is empty" do
    empty_station = DockingStation.new
    expect{empty_station.release_bike}.to raise_exception(RuntimeError,
      "No bikes available")
  end

  it "fails to dock a bike if capacity of 20 is reached" do
    full_station = DockingStation.new
    # p full_station::DEFAULT_CAPACITY
    DockingStation::DEFAULT_CAPACITY.times {full_station.dock(double(:bike))}
    expect{full_station.dock(double(:bike))}.to raise_exception(RuntimeError, "Docking station full")
  end

  it "on initialization create a docking station with non-default capacity" do
    non_default_station = DockingStation.new(10)
    expect(non_default_station.capacity).to eq(10)
  end

  it "on initialization creates a docking station with default capacity" do
    expect(dockingstation.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it "doesn't release a bike when it's broken" do
    broken_bike = double(:bike).report_broken
    dockingstation.dock(broken_bike)
    expect{ dockingstation.release_bike }.to raise_error("Bike is broken")
  end

  it "accepts bikes in any condition, even when broken" do
    broken_bike = double(:bike).report_broken
    dockingstation.dock(broken_bike)
    expect(dockingstation.bike_rack).to eq [broken_bike]
  end

end
