class Station

  def initialize
    @trains = []
    @passengers = []
  end

  def passengers
    0
  end

  def stop(train)
    @trains << train
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

end