require 'docking_station'
require 'Bike'

describe DockingStation do
  dockingstation = DockingStation.new

  it 'responds to the release_bike method' do
    expect(dockingstation).to respond_to(:release_bike)
  end

  it 'checks docking station returns a bike' do
    full_station_1 = DockingStation.new
    a_bike = Bike.new
    full_station_1.dock(a_bike)
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
      "Docking Station is empty")
  end

  it "fails to dock a bike if capacity is reached" do
    full_station = DockingStation.new
    full_station.dock(Bike.new)
    expect{full_station.dock(Bike.new)}.to raise_exception(RuntimeError, "Capacity reached")
  end

end
