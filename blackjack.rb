require_relative 'deck'

def initial_card_deal;
  2.times {
    @deck.draw_card
    @deck.draw_card_dealer}
end

@values_21 = [
  {rank: 'A', value: 1, value2: 11},
  {rank: 2, value: 2, value2: nil},
  {rank: 3, value: 3, value2: nil},
  {rank: 4, value: 4, value2: nil},
  {rank: 5, value: 5, value2: nil},
  {rank: 6, value: 6, value2: nil},
  {rank: 7, value: 7, value2: nil},
  {rank: 8, value: 8, value2: nil},
  {rank: 9, value: 9, value2: nil},
  {rank: 10, value: 10, value2: nil},
  {rank: 'J', value: 10, value2: nil},
  {rank: 'Q', value: 10, value2: nil},
  {rank: 'K', value: 10, value2: nil}
]

puts "Welcome to 21! We hope you enjoy!"
puts "How much would you like to bet?"
bet_amount = gets.chomp.to_i

# Create deck and shuffle the cards
@deck = Deck.new
@deck.shuffle_cards

# Deal 2 cards to the player and the dealer and display player's hand
initial_card_deal
@deck.display_my_hand

# Show dealers first card
@deck.show_dealer_1st_card

# Ask the player if they'd like to be hit with another card until they say no
response = 'yes'
until response == 'no'
  puts "Would you like to draw another card? (yes/no)"
  response = gets.chomp.to_s
  if response == 'yes'
    @deck.draw_card
    @deck.display_my_hand
  else
    break
  end
end

puts "Thank you for playing 21!"


# if the dealer has less than 16 points then give more cards to the dealer until it equals 17 or less
# p.s if the dealer has 16 points or less the Ace automatically is counted as a 1. If his cards equal 17 or more then the Ace equals 11

# Loop - Ask the player if they would like another card or if they want to show their cards against the dealer
# 

