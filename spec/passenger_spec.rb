require 'passenger'

describe Passenger do

  it "should be at home when initialized" do
    passenger = Passenger.new
    expect(passenger.location).to eq "Home"
  end

end
