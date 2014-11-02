require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:station) {double :station, name: "Bond Street"}

  it "should be at home when initialized" do
    expect(passenger.location).to eq "Home"
  end

  it "should be able to go to a train station" do
    passenger.go_to(station)
    expect(passenger.location).to eq "Bond Street"
  end

  it "should have a payment card on initialization" do
    expect(passenger).to have_payment_card
  end

  it "should be possible to lose a payment card" do
    passenger.lose_card
    expect(passenger).not_to have_payment_card
  end

  it "should only be able to enter a station if they have a payment card" do
    passenger.lose_card
    expect{passenger.go_to(station)}.to raise_error("Entry not permitted without card.")
  end

  it "should be able to leave a train station" do

  end

end
