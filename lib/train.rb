class Train

DEFAULT_CARRIAGES = 6

  def initialize(options = {})
    self.number_of_carriages = options.fetch(:number_of_carriages, number_of_carriages)
    @carriages = []
    number_of_carriages.times{@carriages << Carriage.new}
    @location = "Depot"
    @platform = nil
  end
  
  attr_writer :number_of_carriages

  def number_of_carriages
    @number_of_carriages ||= DEFAULT_CARRIAGES
  end

  attr_reader :carriages

  def length
    @carriages.count
  end

  def go_to(destination_station)
    @platform.move(self) unless @location == "Depot"
    destination_station.stop(self)
    @location = destination_station.name
    @platform = destination_station
  end

  def location
    @location
  end


end