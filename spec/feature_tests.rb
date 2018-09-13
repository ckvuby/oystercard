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


In order to know where I have been
As a customer
I want to see all my previous trips

require './lib/oystercard.rb'
oyster = Oystercard.new
oyster.touch_in("Barbican")
oyster.touch_out("Waterloo")
oyster.history
