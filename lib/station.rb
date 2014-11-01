class Station

  def initialize(name = "Depot")
    @trains = []
    @passengers = []
    @capacity = 2
    @name = name
  end

  attr_reader :name

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