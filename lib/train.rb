class Train

DEFAULT_CARRIAGES = 6

  def initialize(options = {})
    self.number_of_carriages = options.fetch(:number_of_carriages, number_of_carriages)
    @train = []
    number_of_carriages.times{@train << Carriage.new}
    @location = "Depot"
  end
  
  attr_writer :number_of_carriages

  def number_of_carriages
    @number_of_carriages ||= DEFAULT_CARRIAGES
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