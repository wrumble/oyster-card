class Oystercard

  attr_reader :balance

  DEFAULT_LIMIT = 90.00

  def initialize
    @balance = 0.00
    @in_journey = false
  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit of £#{DEFAULT_LIMIT}." if limit_reached?(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
     @in_journey
  end

  def touch_in
    @in_journey = true
  end

private

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end


end
