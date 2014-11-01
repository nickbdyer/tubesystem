require 'carriage'

describe Carriage do

  it "should be empty when initialized" do
    carriage = Carriage.new
    expect(carriage).to be_empty
  end

  it "should allow a passenger to board" do
    carriage = Carriage.new
    passenger = double :passenger
    carriage.board(passenger)
    expect(carriage).not_to be_empty
  end

  



end
