class NoBikeException < StandardError
  def initialize(msg="There is no bike availlable", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end

class DockingStation
  attr_reader :bike

  def initialize
    @bike = Bike.new
  end
  
  def release_bike
    if @bike.is_a?(Bike)
      bike = @bike
      @bike = false
      return bike
    else
      raise NoBikeException.new
    end
  end

  def dock_bike(bike)
    @bike = bike
  end
  
end
