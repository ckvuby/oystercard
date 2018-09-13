# require './lib/oystercard.rb'
# oyster = Oystercard.new
# oyster.balance
# oyster.add_money(23)
# oyster.deduct(9)



# oyster.add_money(100)

In order to pay for my journey
As a customer
I need to know where I've travelled from

require './lib/oystercard.rb'
oyster = Oystercard.new
oyster.touch_in("Barbican")
oyster.station 


# In order to know where I have been
# As a customer
# I want to see all my previous trips

require './lib/oystercard.rb'
oyster = Oystercard.new
oyster.touch_in("Barbican")
oyster.touch_out("Waterloo")
oyster.history

# In order to know how far I have travelled
# As a customer
# I want to know what zone a station is in

require './lib/oystercard.rb'
require './lib/station.rb'
oyster = Oystercard.new
station = Station.new('Waterloo', 1)
station.zone

# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

require './lib/oystercard.rb'
require './lib/station.rb'
oyster = Oystercard.new
station = Station.new('Waterloo', 1)
station2 = Station.new('Barbican', 2)
oyster.add_money(23)

oyster.touch_in(station)
oyster.touch_in(station2)

oyster.touch_out(station)
oyster.touch_out(station2)

