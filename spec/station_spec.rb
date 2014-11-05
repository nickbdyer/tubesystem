require 'station'

describe Station do

  let(:bond_street) { Station.new       }
  let(:train)       { double :train     }
  let(:passenger)   { double :passenger }

  it "should be empty of trains when initialized" do
    expect(bond_street.train_count).to eq 0
  end

  it "should be empty of passengers when initialized" do
    expect(bond_street.passenger_count).to eq 0
  end

  it "should accept a train at the station" do
    bond_street.stop(train)
    expect(bond_street.train_count).to eq 1
  end

  it "should accept a passenger at the station" do
    bond_street.accept(passenger)
    expect(bond_street.passenger_count).to eq 1
  end

  it "should know when it is full of trains" do
    2.times{bond_street.stop(train)}
    expect(bond_street).to be_full
  end

  it "should be able to release(move) a train" do
    bond_street.stop(train)
    bond_street.move(train)
    expect(bond_street.train_count).to eq 0
  end

  it "should release a passenger from the station" do
    bond_street.accept(passenger)
    bond_street.release(passenger)
    expect(bond_street.passenger_count).to eq 0
  end

end