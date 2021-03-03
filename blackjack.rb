

require_relative 'deck'

# Create methods for program
def initial_card_deal
  2.times {
    @deck.draw_card
    @deck.draw_card_dealer
  }
end

def card_hit
  response = 'yes'
  until response == 'no'
    puts "Would you like to draw another card? (yes/no)"
    response = gets.chomp.to_s
    puts "\n"
    if response == 'yes'
      @deck.draw_card
      @deck.display_my_hand
    else
      break
    end
  end
end

def who_won
  if @deck.show_card_values_dealer > 21
    puts "You Won!"
  elsif @deck.show_card_values == @deck.show_card_values_dealer
    puts "You tied!"
  elsif @deck.show_card_values > @deck.show_card_values_dealer
    puts "You Won!"
  elsif @deck.show_card_values < @deck.show_card_values_dealer
    puts "You Lost!"
  end
end

def blackjack_game
  #Begin Program
  puts "Welcome to 21! We hope you enjoy!\n\n"
  puts "How many dollars would you like to bet?"
  bet_amount = gets.chomp.to_i
  puts "\n"

  # Create deck and shuffle the cards
  @deck = Deck.new
  @deck.shuffle_cards

  # Deal 2 cards to the player and the dealer. Display player's hand.
  initial_card_deal
  @deck.display_my_hand

  # Show dealers first card
  @deck.show_dealer_1st_card

  # Ask the player if they'd like to be hit with another card until they say no
  card_hit

  # Calcuate the value of the players hand
  if @deck.show_card_values > 21
    puts "You Lost!"
    puts "\nThank you for playing 21!"
    exit
  end

  # Calculate the value of the players hand and say who won
  who_won

  puts "\nThank you for playing 21!"
end

