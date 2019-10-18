require 'docking_station'
require 'Bike'

describe DockingStation.new do
  let(:bike) { double :bike }

  it 'responds to the release_bike method' do
    expect(subject).to respond_to(:release_bike)
  end

  it 'checks docking station returns a bike' do
    allow(bike).to receive(:broken?).and_return(false)
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end

  it 'checks whether bike is working' do
    allow(bike).to receive(:broken?).and_return(false)
    allow(bike).to receive(:working?).and_return(true)
    subject.dock(bike)
    test_bike = subject.release_bike
    expect(test_bike.working?).to eq true
  end

  it 'responds to dock method' do
    expect(subject).to respond_to(:dock)
  end

  it 'check docking station docks bike' do
    docked_bike = bike
    subject.dock(docked_bike)
    expect(subject.bike_rack).to eq([docked_bike])
  end

  it "fails to release bike if docking station is empty" do
    expect{subject.release_bike}.to raise_exception(RuntimeError, "No bikes available")
  end

  it "fails to dock a bike if capacity of 20 is reached" do
    # p full_station::DEFAULT_CAPACITY
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
    expect{subject.dock(bike)}.to raise_exception(RuntimeError, "Docking station full")
  end

  it "on initialization create a docking station with non-default capacity" do
    non_default_station = DockingStation.new(10)
    expect(non_default_station.capacity).to eq(10)
  end

  it "on initialization creates a docking station with default capacity" do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it "doesn't release a bike when it's broken" do
    allow(bike).to receive(:broken?).and_return(true)
    allow(bike).to receive(:report_broken).and_return(true)
    broken_bike = bike
    broken_bike.report_broken
    subject.dock(broken_bike)
    expect{ subject.release_bike }.to raise_error("Bike is broken")

  end

  it "accepts bikes in any condition, even when broken" do
    allow(bike).to receive(:report_broken).and_return(true)
    broken_bike = bike
    broken_bike.report_broken
    subject.dock(broken_bike)
    expect(subject.bike_rack).to eq [broken_bike]
  end

end
