class Oystercard

  attr_reader :balance

  MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def deduct_money(amount)
    @balance -= amount
  end

  def touch_in
    
  end

  def touch_out
  
  end

  def in_journey?
    
  end
end
