class Oystercard

  attr_reader :balance, :status, :entry_station, :history

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @history = []
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    fail 'Cannot touch in: balance below minimum' if balance < MINIMUM_VALUE
    @entry_station = station
  end

  def touch_out(exit_station)
    @history << { :entry => entry_station, :exit_station => exit_station}
    @entry_station = nil
    deduct_money(MINIMUM_VALUE)
  end

  def in_journey?
    !@entry_station.nil? 
  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
