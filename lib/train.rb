class Train

DEFAULT_CARRIAGES = 2

attr_reader :location
attr_reader :carriages
attr_reader :passengers
attr_writer :number_of_carriages

  def initialize(options = {})
    self.number_of_carriages = options.fetch(:number_of_carriages, number_of_carriages)
    @carriages = []
    number_of_carriages.times{@carriages << Carriage.new}
    @location = "Depot"
    @platform = nil
    @passengers = []
  end

  def number_of_carriages
    @number_of_carriages ||= DEFAULT_CARRIAGES
  end

  def length
    @carriages.count
  end

  def go_to(destination_station)
    @platform.move(self) unless @location == "Depot"
    destination_station.stop(self)
    @location = destination_station.name
    @platform = destination_station
    update_passenger_location
  end

  def passenger_count
    passengers_array
    @passengers.count
  end


  def update_passenger_location
    passengers_array
    @passengers.each do |passenger|
      passenger.location = @location
    end
  end

private 

  def passengers_array
    @carriages.each do |carriage|
      carriage.passengers.each do |passenger|
        @passengers << passenger
      end
    end
  end
  
end