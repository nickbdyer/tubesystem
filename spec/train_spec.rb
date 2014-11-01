require 'Train'

describe Train do

  it "should have 6 carriages when initialized" do
    train = Train.new
    expect(train.carriage_count).to eq 6
  end

  it "should be possible to set the number of carriages on initialization" do
    train = Train.new(carriages: 8)
    expect(train.carriage_count).to eq 8
  end


end