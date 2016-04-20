require './lib/oystercard.rb'

oy = Oystercard.new

oy.top_up(5)
oy.touch_in("Baker Street")
oy.touch_out("Bond Street")
oy.journey_log
