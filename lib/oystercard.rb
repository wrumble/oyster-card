class Oystercard

  attr_reader :balance

  MAX_LIMIT = 90.00


  def initialize
    @balance = 0.00

  end

  def top_up(money)
    fail "Top up amount pushes you over your maximum oyster card limit." if limit_reached?(money)

      @balance += money

    end
private
  def limit_reached?(money)
    @balance + money >= MAX_LIMIT
  end


end
