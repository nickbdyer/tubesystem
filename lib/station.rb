class Station

  def initialize
    @trains = []
    @passengers = []
    @capacity = 2
  end

  def passengers
    0
  end

  def stop(train)
    @trains << train
  end

  def start(train)
    @trains.delete(train)
  end

  def train_count
    @trains.count
  end

  def accept(passenger)
    @passengers << passenger
  end

  def passenger_count
    @passengers.count
  end

  def full?
    train_count >= @capacity
  end

end