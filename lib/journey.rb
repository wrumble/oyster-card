require_relative 'oystercard'

class Journey



  def in_journey?
   !!@entry_station
  end

  private

  def current_journey(exit_station)
    @journeys << { @entry_station => exit_station }
  end


end