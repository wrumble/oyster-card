class Journey
  def initialize
    @journeys = {}
    @journey_history = []
  end

  def start(station)
    @journeys[:entry_station] = station
  end

  def finish(station)
    @journeys[:exit_station] = station
    @journey_history << @journeys
  end

  def complete?
    !!@entry_station
  end
end
