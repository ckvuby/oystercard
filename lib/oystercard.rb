class Oystercard

  attr_reader :balance, :status, :entry_station, :history, :in_journey

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1
  PENALTY = 6

  def initialize
    @balance = 0
    @history = []
    @journey = Journey.new
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    @journey.start
    fail 'Cannot touch in: balance below minimum' if balance < MINIMUM_VALUE
    @entry_station = station
    @journey.fare = MINIMUM_VALUE
  end

  def touch_out(exit_station)
    @journey.end
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
