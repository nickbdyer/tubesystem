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

  it "should have a payment card on initialization" do
    passenger = Passenger.new
    expect(passenger).to have_payment_card
  end

  it "should be possible to lose a payment card" do
    passenger = Passenger.new
    passenger.lose_card
    expect(passenger).not_to have_payment_card
  end

  it "should only be able to enter a station if they have a payment card" do
    passenger = Passenger.new
    passenger.lose_card
    station = (double :station, name: "Bond Street")
    expect{passenger.go_to(station)}.to raise_error("Entry not permitted without card.")
  end

end
