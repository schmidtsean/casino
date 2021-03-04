require_relative 'deck'

class Blackjack
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
    dealer_value = @deck.show_card_values_dealer
    puts "Your total amount of points is: #{@player_value}\n"
    puts "The dealer's total amount of points is #{dealer_value}\n"
    if dealer_value > 21
      puts "You Won!"
      $wallet += (@bet_amount * 2)
    elsif @player_value == dealer_value
      puts "You tied!"
      $wallet += (@bet_amount)
    elsif @player_value > dealer_value
      puts "You Won!"
      $wallet += (@bet_amount * 2)
    elsif @player_value < dealer_value
      puts "You Lost!"
    end
  end

  def bet_amount_choice
    if $wallet >= @bet_amount
      $wallet -= @bet_amount
    else
      puts "You do not have enough funds to bet $#{@bet_amount}."
      puts "Would you like to 1. Choose a different amount or 2. Go to main menu?"
      bet_choice = gets.chomp.to_i
      if bet_choice == 1
        blackjack_game
      else
        @app.display_main_menu
      end
    end 
  end

  def blackjack_game
    #Begin Program
    @app = App.new
    puts "Welcome to 21! We hope you enjoy!\n\n"
    puts "How many dollars would you like to bet?"
    @bet_amount = gets.chomp.to_i
    puts "\n"
    bet_amount_choice

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
    @player_value = @deck.show_card_values
    if @player_value > 21
      puts "Your total amount of points is: #{@player_value}\n"
      puts "You Busted!"
      puts "\nThank you for playing 21!\n\n"
      puts "Would you like to play again? (1) Yes (2) No" 
      blackjack_choice = gets.chomp.to_i
      if blackjack_choice == 1
        blackjack_game
      else
        @app.display_main_menu
      end
    end


    # Calculate the value of the players hand and say who won
    who_won
    puts "\nThank you for playing 21!"

    puts "Would you like to play again? (1) Yes (2) No" 
      blackjack_choice = gets.chomp.to_i
      if blackjack_choice == 1
        blackjack_game
      else
        @app.display_main_menu
      end
    
  end
end
