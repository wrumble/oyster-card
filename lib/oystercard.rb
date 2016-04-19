class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey_history
  LIMIT = 90
  MIN_BAL = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def in_journey?
    if @journey_history.empty?
      false
    elsif @journey_history
    end
  end

  def touch_in(station)
    fail "min balance has to be >£#{MIN_BAL}" if @balance < MIN_BAL
    @journeys << {:entry_station => station}
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys.last.merge!(:exit_station => station)
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
