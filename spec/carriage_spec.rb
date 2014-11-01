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


  it "should allow a passenge to alight" do
    carriage.board(passenger)
    carriage.alight(passenger)
    expect(carriage).to be_empty
  end


end
