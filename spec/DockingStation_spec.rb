require "DockingStation"

test_docking_station = DockingStation.new

describe DockingStation do

  describe "release_bike" do
    it "releases a bike" do
      expect(test_docking_station).to respond_to(:release_bike)
    end

  end

end
