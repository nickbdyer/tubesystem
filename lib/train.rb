class Train

DEFAULT_CARRIAGES = 2

attr_reader :at_platform
attr_reader :carriages
attr_reader :passengers
attr_writer :number_of_carriages

  def initialize(options = {})
    @at_platform = nil
    @carriages = []
    @passengers = []
    self.number_of_carriages = options.fetch(:number_of_carriages, number_of_carriages)
    number_of_carriages.times{@carriages << Carriage.new}
  end

  def number_of_carriages
    @number_of_carriages ||= DEFAULT_CARRIAGES
  end

  def length
    @carriages.count
  end

  def go_to(destination_station)
    @at_platform.move(self) unless !@at_platform
    destination_station.stop(self)
    update_location(destination_station)
  end

  def update_location(destination_station)
    @at_platform = destination_station
    update_passenger_location
  end

  def update_passenger_location
    @passengers.each do |passenger|
      passenger.station = @at_platform
    end
  end

  def add_passenger(passenger)
    @passengers << passenger
  end  

  def remove_passenger(passenger)
    @passengers.delete(passenger)
  end


end