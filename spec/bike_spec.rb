require "Bike"

describe Bike do
  test_bike = Bike.new
  it "test bike has working? method" do
    expect(test_bike).to respond_to(:working?)
  end

end
