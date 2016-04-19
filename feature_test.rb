require './lib/oystercard.rb'

oy = Oystercard.new

oy.top_up(5)
oy.touch_in("Bakerstreet")
oy.entry_station
oy.touch_out
oy.entry_station
