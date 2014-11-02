class Train

DEFAULT_CARRIAGES = 6

  def initialize(options = {})
    self.number_of_carriages = options.fetch(:number_of_carriages, number_of_carriages)
    @carriages = []
    number_of_carriages.times{@carriages << Carriage.new}
    @location = "Depot"
  end
  
  attr_writer :number_of_carriages

  def number_of_carriages
    @number_of_carriages ||= DEFAULT_CARRIAGES
  end

  attr_reader :carriages

  def length
    @carriages.count
  end

  def go_to(station)
    @location = station.name
  end

  def location
    @location
  end

  def board
  end


end