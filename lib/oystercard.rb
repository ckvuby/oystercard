class Oystercard

  attr_reader :balance, :status

  MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
    @status = false
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def deduct_money(amount)
    @balance -= amount
  end

  def touch_in
    @status = true
  end

  def touch_out
  
  end

  def in_journey?
    
  end
end
