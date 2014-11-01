class Carriage

  def initialize
    @passengers = []
    @capacity = 40
  end

  def empty?
    @passengers.count == 0
  end

  def board(passenger)
    @passengers << passenger
  end

  def alight(passenger)
    @passengers.delete(passenger)
  end

  def full?
    @passengers.count >= @capacity
  end

end