require_relative 'deck'
require_relative 'card'

deck = Deck.new
puts "New deck ready."
deck.shuffle
puts "Shuffled deck."
size = deck.size
for i in 0..size-1
    card = deck.deal_one
    puts "Dealt: #{card}. #{i+1} card(s) dealt. #{deck.size} remaining."
end
