class Oystercard

  attr_reader :balance, :entry_station, :journeys

  DEFAULT_LIMIT = 90.00
  MIN_BALANCE = 1.00
  MIN_FARE = 1.00

  def initialize
    @balance = 0.00
    @journeys = []
  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit of £#{DEFAULT_LIMIT}." if limit_reached?(money)
    @balance += money
  end

  def in_journey?
   !!@entry_station
  end

  def touch_in(station)
    fail "Must have more than £#{MIN_BALANCE} on your card to touch in." if not_enough_balance?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    current_journey(station)
    @entry_station = nil
  end

private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def not_enough_balance?
    @balance < 1.00
  end

  def deduct(fare)
    @balance -= fare
  end

  def current_journey(exit_station)
    @journeys << { @entry_station => exit_station }
  end

end
