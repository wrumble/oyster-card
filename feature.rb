require './lib/pystercard.rb'

oystercard = Oystercard.new
# In order to use public transport
# As a customer
# I want money on my card

oystercard.top_up(3)

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

oystercard.top_up(91)

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
