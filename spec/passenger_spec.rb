require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:station)   { double :station, name: "Bond Street", accept: nil}
  let(:station1)  { Station.new("Clapham Common")}
  let(:train)     { Train.new }
  let(:train2)    { double :train, board: nil, location: "Victoria"}

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
    passenger.go_to(station)
    passenger.leave(station)
    expect(passenger.location).to eq "Home"
  end

  it "should not be possible to board a train that isn't at the station" do
    passenger.go_to(station)
    expect{passenger.board(train2, 1)}.to raise_error("That train isn't here.")
  end

  # it "should be able to board a train" do
  #   passenger.go_to(station)
  #   passenger.board(train, 1)
  #   expect(train.carriages[1].empty?).to be false
  # end

 it "should be able to alight a train" do
    passenger.go_to(station1)
    train.go_to(station1)
    passenger.board(train, 1)
    passenger.alight(train, 1)
    expect(train.carriages[1].empty?).to be true
  end

end
