require_relative 'oystercard'

class Journey

  attr_reader :entry_station

  def initialize(entry_station)
      @entry_station = entry_station
  end

  def in_journey?
   !!@entry_station
  end

  def complete_journey(exit)
    1
  end

  #def fare
  #whatever zone chargbes apply
  #end

  private

  def current_journey(exit_station)
    @journeys << { @entry_station => exit_station }
  end


end
