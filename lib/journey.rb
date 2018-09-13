

class Journey

  attr_accessor :fare
  MINIMUM_VALUE = 1
  PENALTY = 6

 def initialize
   @fare = MINIMUM_VALUE
   
 end

def start
  if @in_journey == true
    fare == PENALTY
    deduct_money(fare)
    @history << { :entry => entry_station, :exit_station => "incomplete journey"}
    @entry_station = nil

  end
end

def end
  if @in_journey == false
    fare == PENALTY
    deduct_money(fare)
    @history << { :entry => "incomplete journey", :exit_station => exit_station}
  end
end

end
