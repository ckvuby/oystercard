class Oystercard

  attr_reader :balance, :status, :departure_station

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @status = false
    @departure_station
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    fail 'Cannot touch in: balance below minimum' if balance < MINIMUM_VALUE
    @status = true
    @departure_station = station
  end

  def touch_out
    @status = false
    deduct_money(MINIMUM_VALUE)
  end

  def in_journey?
    status
  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
