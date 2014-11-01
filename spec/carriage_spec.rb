require 'carriage'

describe Carriage do

  let(:carriage)  { Carriage.new      }   
  let(:passenger) { double :passenger }

  it "should be empty when initialized" do
    expect(carriage).to be_empty
  end

  it "should allow a passenger to board" do
    carriage.board(passenger)
    expect(carriage).not_to be_empty
  end

  it "should allow a passenger to alight" do
    carriage.board(passenger)
    carriage.alight(passenger)
    expect(carriage).to be_empty
  end

  it "should know when it is full" do
    40.times{carriage.board(passenger)}
    expect(carriage).to be_full
  end

end
