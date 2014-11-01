class Station

  def initialize
    @trains = []
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

end