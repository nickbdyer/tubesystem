class Passenger

  attr_accessor :station

  def initialize
    @has_payment_card = true
    @station = nil
  end

  def has_payment_card?
    @has_payment_card
  end

  def lose_card
    @has_payment_card = false
  end

  def go_to(station)
    raise "Entry not permitted without card." unless has_payment_card?
    station.accept(self)
    @station = station
  end

  def leave(station)
    raise "You can not leave a station you are not at." if @station != station
    station.release(self)
    @station = nil
  end

  def board(train, carriage_number)
    raise "That train isn't here." if @station != train.at_platform
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
 