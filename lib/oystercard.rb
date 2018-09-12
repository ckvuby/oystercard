class Oystercard

  attr_reader :balance, :status, :entry_station, :exit_station, :history, :new_hash

  MAXIMUM_VALUE = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @entry_station
    @exit_station
    @history = []
    @new_hash = {}
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    fail 'Cannot touch in: balance below minimum' if balance < MINIMUM_VALUE
    @entry_station = station
    @new_hash[:entry] = station
  end

  def touch_out(exit_station)
    @entry_station = nil
    @new_hash[:exit_station] = exit_station
    @history.push(@new_hash)
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
