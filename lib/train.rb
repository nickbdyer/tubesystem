class Train

DEFAULT_CARRIAGES = 6

  def initialize(options = {})
    self.carriages = options.fetch(:carriages, carriages)
    @train = []
    carriages.times{@train << Carriage.new}
    @location = "Depot"
  end
  
  attr_writer :carriages

  def carriages
    @carriages ||= DEFAULT_CARRIAGES
  end

  def length
    @train.count
  end

  def go_to(station)
    @location = station.name
  end

  def location
    @location
  end


end