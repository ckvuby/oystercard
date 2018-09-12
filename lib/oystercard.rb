class Oystercard

  attr_reader :balance, :status, :departure_station

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @departure_station
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    fail 'Cannot touch in: balance below minimum' if balance < MINIMUM_VALUE
    @departure_station = station
  end

  def touch_out
    @departure_station = nil
    deduct_money(MINIMUM_VALUE)
  end

  def in_journey?
    @departure_station != nil
  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
