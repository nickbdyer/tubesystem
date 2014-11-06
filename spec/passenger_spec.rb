require 'passenger'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:station)   { double :station, accept: nil, release: nil  }
  let(:station1)  { double :station                             }
  let(:train)     { double :train, at_platform: station1        }
  let(:train1)    { double :train, at_platform: station         }
  

  it "should be at home when initialized" do
    expect(passenger.station).to eq nil
  end

  it "should be able to go to a train station" do
    passenger.go_to(station)
    expect(passenger.station).to eq station
  end

  it "should be able to leave a train station" do
    passenger.go_to(station)
    passenger.leave(station)
    expect(passenger.station).to eq nil
  end

  it "should have a payment card on initialization" do
    expect(passenger).to have_funds
  end

  it "should be possible to lose a payment card" do
    passenger.lose_card
    expect(passenger).not_to have_funds
  end

  it "should only be able to enter a station if they have a payment card" do
    passenger.lose_card
    expect{passenger.go_to(station)}.to raise_error("Entry not permitted without credit.")
  end

  it "should only be able to leave the train station it is at" do
    passenger.go_to(station)
    expect{passenger.leave(station1)}.to raise_error("You can not leave a station you are not at.")
  end

  it "should not be possible to board a train that isn't at the station" do
    passenger.go_to(station)
    expect{passenger.board(train, 1)}.to raise_error("That train isn't here.")
  end

  it "should not exist in a station when it boards a train" do
    carriage = double :carriage
    passenger.go_to(station)
    allow(train1).to receive(:carriages).and_return([carriage])
    allow(train1).to receive(:add_passenger).with(passenger)
    allow(carriage).to receive(:board)
    expect(station).to receive(:release).with(passenger)
    passenger.board(train1, 0)
  end


end
