class Oystercard

  attr_reader :balance, :journeys
  LIMIT = 90
  MIN_BAL = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def in_journey?
    !!journeys[:entry_station]
  end

  def touch_in(station)
    fail "min balance has to be >£#{MIN_BAL}" if @balance < MIN_BAL
    @journeys[:entry_station] = station

  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys[:exit_station] = station
  end
  private
  def deduct(amount)
    @balance -= amount
  end
end
