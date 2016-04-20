class Journey
  attr_reader :journeys

  def initialize
    @journeys = []
  end

  def in_journey?
    @journeys.empty? ? false : @journeys.last.length < 2
  end

  def entry_station(station)
    @journeys << {:entry_station => station}
  end

  def exit_station(station)
    @journeys.last.merge!(:exit_station => station)
  end
end
