require_relative 'oystercard'

class Journey

  attr_reader :entry_station

  def initialize(name)
      @entry_station = name
  end

  def in_journey?
   !!@entry_station
  end

  #def fare
  #whatever zone chargbes apply
  #end

  private

  def current_journey(exit_station)
    @journeys << { @entry_station => exit_station }
  end


end
