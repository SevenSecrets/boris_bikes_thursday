require "Bike"

describe Bike do
  test_bike = Bike.new
  it "test bike has working? method" do
    expect(test_bike).to be_working
  end

  it "can be reported broken" do
    test_bike.report_broken
    expect(test_bike).to be_broken
  end

end
