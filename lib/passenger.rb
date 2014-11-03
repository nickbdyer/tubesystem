class Passenger

  def initialize
    @location = "Home"
    @has_payment_card = true
  end

  attr_accessor :location

    def has_payment_card?
    @has_payment_card
  end

  def lose_card
    @has_payment_card = false
  end

  def go_to(station)
    raise "Entry not permitted without card." unless has_payment_card?
    @location = station.name
    station.accept(self)
  end

  def leave(station)
    @location = "Home"
    station.release(self)
  end

  def board(train, carriage_number)
    raise "That train isn't here." if @location != train.location
    train.carriages[carriage_number].board(self)
  end

  def alight(train, carriage_number)
    raise "You are not in that train carriage." if !train.carriages[carriage_number].passengers.include? self 
    train.carriages[carriage_number].alight(self)
  end


end
 