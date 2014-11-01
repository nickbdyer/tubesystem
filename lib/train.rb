class Train

DEFAULT_CARRIAGES = 6

  def initialize(options = {})
    self.carriages = options.fetch(:carriages, carriages)
  end
  
  attr_writer :carriages

  def carriages
    @carriages ||= DEFAULT_CARRIAGES
  end

  def carriage_count
    @carriages
  end

end