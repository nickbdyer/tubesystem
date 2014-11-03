class Station

  def initialize(name = "Depot")
    @trains = []
    @passengers = []
    @capacity = 2
    @name = name
  end

  attr_reader :name

  def stop(train)
    @trains << train
  end

  def move(train)
    @trains.delete(train)
  end

  def accept(passenger)
    @passengers << passenger
  end

  def release(passenger)
    @passengers.delete(passenger)
  end

  def passenger_count
    @passengers.count
  end

  def train_count
    @trains.count
  end

  def full?
    train_count >= @capacity
  end

end