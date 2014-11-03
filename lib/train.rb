class Train

DEFAULT_CARRIAGES = 2

attr_reader :location
attr_reader :carriages
attr_reader :passengers
attr_writer :number_of_carriages

  def initialize(options = {})
    @location = "Depot"
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
    @location = destination_station.name
    @at_platform = destination_station
    update_passenger_location
  end

  def update_passenger_location
    create_passengers_array
    @passengers.each do |passenger|
      passenger.location = @location
    end
  end

  # Not sure that this method is actually required.
  # def passenger_count
  #   create_passengers_array
  #   @passengers.count
  # end

private 

  def create_passengers_array
    @carriages.each do |carriage|
      carriage.passengers.each do |passenger|
        @passengers << passenger
      end
    end

  end

end