class Oystercard

  attr_reader :balance
  LIMIT = 90
  MIN_BAL = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "min balance has to be >£#{MIN_BAL}" if @balance < MIN_BAL
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end
  private
  def deduct(amount)
    @balance -= amount
  end
end
