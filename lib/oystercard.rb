class Oystercard

  attr_reader :balance
    LIMIT = 90
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "maximum limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount # @balance = @balance + amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end
end
