require 'station'

describe Station do

  it "should be empty of trains when initialized" do
    bond_street = Station.new
    expect(bond_street.trains).to eq 0
  end

  it "should be empty of passengers when initialized" do
    bond_street = Station.new
    expect(bond_street.passengers).to eq 0
  end

end