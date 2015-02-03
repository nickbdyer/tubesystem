require 'spec_helper'
require 'train'

describe Train do

  let(:train)      { Train.new       }
  let(:old_street) { double :station, name: "Old Street", stop: nil }
  let(:passenger)  { double :passenger, location: nil}

  it "should have 2 carriages when initialized" do
    train = Train.new
    expect(train.length).to eq 2
  end

  it "should be at the Depot when initialised" do
    expect(train.at_platform).to eq nil
  end

  it "should be possible to set the number of carriages on initialization" do
    train = Train.new(number_of_carriages: 8)
    expect(train.length).to eq 8
  end

  it "should know what station it is at" do
    train.go_to(old_street)
    expect(train.at_platform).to eq old_street
  end

  it "should be able to inform the passengers of their new location" do
    train.add_passenger(passenger)
    expect(passenger).to receive(:station=)
    train.go_to(old_street)
  end

  it "should be able to let passegners off the train" do
    train.add_passenger(passenger)
    expect(train.passengers).to eq([passenger])
    train.remove_passenger(passenger)
    expect(train.passengers).to eq([])
  end


end
