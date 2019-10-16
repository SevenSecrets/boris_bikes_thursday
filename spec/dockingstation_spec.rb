require 'docking_station'

describe DockingStation do
  dockingstation = DockingStation.new

  it 'responds to the release_bike method' do
    expect(dockingstation).to respond_to(:release_bike)
  end

  it 'checks docking station returns a bike' do
    expect(dockingstation.release_bike).to be_instance_of(Bike)
  end

  it 'checks whether bike is working' do
    test_bike = dockingstation.release_bike
    expect(test_bike.working?).to eq true
  end

end
