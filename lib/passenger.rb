class Passenger

  def initialize
    @location = "Home"
    @has_payment_card = true
  end

  def location
    @location
  end

  def go_to(station)
    raise "Entry not permitted without card." unless has_payment_card?
    @location = station.name
  end

  def has_payment_card?
    @has_payment_card
  end

  def lose_card
    @has_payment_card = false
  end

end
 