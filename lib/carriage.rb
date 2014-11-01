class Carriage

  def initialize
    @passengers = []
  end

  def empty?
    @passengers.count == 0
  end

  def board(passenger)
    @passengers << passenger
  end

end