class Passenger

  def initialize
    @location = "Home"
  end


  def location
    @location
  end

  def go_to(station)
    @location = station.name
  end

  def has_payment_card?
    true
  end

end
 