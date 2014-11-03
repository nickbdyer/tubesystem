require 'Train'

describe Train do

  let(:train)      { Train.new       }
  let(:old_street) { double :station, name: "Old Street", stop: nil }
  let(:passenger)  { double :passenger, location: nil}

  it "should have 2 carriages when initialized" do
    train = Train.new
    expect(train.length).to eq 2
  end

  it "should be at the Depot when initialised" do
    expect(train.location).to eq "Depot"
  end

  it "should be possible to set the number of carriages on initialization" do
    train = Train.new(number_of_carriages: 8)
    expect(train.length).to eq 8
  end

  it "should know what station it is at" do
    train.go_to(old_street)
    expect(train.location).to eq "Old Street"
  end

  # Not sure this test is required, duplication in carriage. 
  # it "should know how many passengers it has" do
  #   10.times{train.carriages[0].board(passenger)}
  #   10.times{train.carriages[0].board(passenger)}
  #   expect(train.passenger_count).to eq 20
  # end

  it "should be able to inform the passengers of their new location" do
    train.carriages[0].board(passenger)
    expect(passenger).to receive(:location=).with("Old Street")
    train.go_to(old_street)
  end

end