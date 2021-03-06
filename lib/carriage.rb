class Carriage

  def initialize
    @passengers = []
    @capacity = 40
  end

  attr_reader :passengers

  def empty?
    @passengers.count == 0
  end

  def board(passenger)
    raise "Carriage is full." if full?
    @passengers << passenger unless full?
  end

  def alight(passenger)
    @passengers.delete(passenger)
  end

  def full?
    @passengers.count >= @capacity
  end

end