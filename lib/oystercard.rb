require_relative 'journey'
class Oystercard

  attr_reader :balance
  LIMIT = 90
  MIN_BAL = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "min balance has to be >£#{MIN_BAL}" if @balance < MIN_BAL
    #@journeys << {:entry_station => station}
    @journey.entry_station(station)

  end

  def touch_out(station)
    deduct(MIN_FARE)
    #@journeys.last.merge!(:exit_station => station)
    @journey.exit_station(station)
  end

  def journey_log
    @journey.journeys
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
