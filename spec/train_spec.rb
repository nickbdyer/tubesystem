require 'Train'

describe Train do

  it "should have 6 carriages when initialised" do
    train = Train.new
    expect(train.carriage_count).to eq 6
  end

end