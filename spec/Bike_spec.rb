require "Bike"

describe Bike do

  describe "bike tests" do
    it "responds to working? method" do
      expect(Bike.new).to respond_to(:working?)
  end
  end
end
