class Oystercard

  attr_reader :balance
    LIMIT = 90
  def initialize
    @balance = 0
  end
  def top_up(amount)
    @balance += amount # @balance = @balance + amount
  end

end
