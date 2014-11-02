require 'passenger'

describe Passenger do

  it "should be at home when initialized" do
    passenger = Passenger.new
    expect(passenger.location).to eq "Home"
  end

  it "should be able to go to a train station" do
    station = (double :station, name: "Bond Street")
    passenger = Passenger.new
    passenger.go_to(station)
    expect(passenger.location).to eq "Bond Street"
  end

end
