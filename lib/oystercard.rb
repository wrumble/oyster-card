class Oystercard

  attr_reader :balance

  DEFAULT_LIMIT = 90.00
  MIN_BALANCE = 1.00
  MIN_FARE = 1.00

  def initialize
    @balance = 0.00
    @in_journey = false
  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit of £#{DEFAULT_LIMIT}." if limit_reached?(money)
    @balance += money
  end

  def in_journey?
     @in_journey
  end

  def touch_in
    fail "Must have more than £#{MIN_BALANCE} on your card to touch in." if not_enough_balance?
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
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

end
