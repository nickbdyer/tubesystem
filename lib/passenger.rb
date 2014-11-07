class Passenger

  attr_accessor :station

  def initialize
    @payment_card = 1 + rand(1..4)
  end

  def has_funds?
    @payment_card >= 2
  end

  def lose_card
    @payment_card = 0
  end

  def go_to(station)
    raise "Entry not permitted without credit." unless has_funds?
    station.accept(self)
    self.station = station
  end

  def leave(station)
    raise "You can not leave a station you are not at." if @station != station
    station.release(self)
    @payment_card -= 2
    self.station = nil
  end

  def board(train, carriage_number)
    raise "That train isn't here." if station != train.at_platform
    get_on_train(train, carriage_number)
  end

  def alight(train, carriage_number)
    raise "You are not in that train carriage." if !train.carriages[carriage_number].passengers.include? self 
    get_off_train(train, carriage_number)
  end

private

  def get_on_train(train, carriage_number)
    train.carriages[carriage_number].board(self)
    train.add_passenger(self)
    @station.release(self)
  end

  def get_off_train(train, carriage_number)
    train.carriages[carriage_number].alight(self)
    train.remove_passenger(self)
    @station.accept(self)
  end


end
 