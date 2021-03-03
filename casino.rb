
puts "What Is Your Name?"
name = gets.chomp
puts "How Much Would You Like To Add To Your Account?"
account = gets.chomp.to_f
puts "Hello #{name} your account total is $#{account}"

@wallet = account 

@menu = [
  {key:1, name: "SLOTS"},
  {key:2, name: "21 (BLACKJACK)"},
  {key:3, name: "ROULETTE"},
  {key:4, name: "SHOW BALANCE"},
  {key:5, name: "EXIT"}
]

def display_options
  @menu.each_with_index do | menu, index|
    puts " #{menu[:key]}, #{menu[:name]}"
  end
end

def show_balance
  puts "Your Balance Is #{@wallet}"
end

def display_main_menu
  puts "WHAT WOULD YOU LIKE TO PLAY?"
  display_options
  choice = gets.chomp.to_i
  case choice
  when 1
    puts "WELCOME TO SLOTS!"

  def start_slots
    pull_lever
    
  end
  
  def pull_lever
    @slot_num1 = 1 + rand(9)
    @slot_num2 = 1 + rand(9) 
    @slot_num3 = 1 + rand(9)
  show_num
  end
  
  def show_num
    puts @slot_num1, @slot_num2, @slot_num3
  end


def bet
  @wallet -= 1
end

def not_enough_cash
  if @wallet > 0
    slot
  else @wallet < 0
    puts "You Do Not Have Enough Money"
    exit                                      #fix this when added to main
  end
end

def winnings 
  if @slot_num1 == @slot_num3 && @slot_num2 == @slot_num1 # when all numbers equal
    puts "YOU'RE ON FIRE!!! ALL THREE!!! $100"
    @wallet += 100
  elsif @slot_num2 == @slot_num3 #when number 2 and 3 equal
    puts "AWESOME!! $1"
    @wallet += 1
  elsif @slot_num1 == @slot_num3 #when number 1 and 3 equal
    puts "WOW!!! $1"
    @wallet += 1
  elsif @slot_num1 == @slot_num2 #when number 1 and 2 equal
    puts "SWEET!!! $1"
    @wallet += 1
  else 
    puts "LOSER... TRY AGAIN!"
  end
end

def play_slots 
  puts "Enter $1 to spin"
  not_enough_cash
end

def slot 
  
  puts "Press 1.To Spin 2.To exit"
  choice = gets.chomp.to_i
  
  puts "_" * 20
  case choice
  when 1
    bet
    start_slots
    
    winnings
    play_slots
    
  when 2
    puts "Your Balance Is $#{@wallet}"
    puts "Thank You For Playing!"
    display_main_menu
  end 
end
play_slots
  when 2
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
 
    
  puts "Would you like to play again? ( Yes  No)"
  choice = gets.chomp.to_s
  if choice == "yes"
    blackjack_game
  elsif choice == "no"
    display_main_menu
  
end
  
end
blackjack_game
  when 3
    @balance = @wallet
puts "welcome to the Roulette table. your balance is $#{@balance}"
puts "How much would you like to bet?"
@bet = gets.chomp.to_i

@menu =[
    {key:1, name: "Color"},
    {key:2, name: "Odd or even"},
    {key:3, name: "Number"},
    {key:4, name: "View balance?"}
]



# def display_dis
#     @display.each_with_index do | display, index |
#         puts " #{display[:key]}, #{display[:name]}"
#     end
# end

def display_options
    @menu.each_with_index do | menu, index |
        puts " #{menu[:key]}, #{menu[:name]}"
    end
end

def table_number
    @results = rand(1..36)
end

def table_color
    red = 1
    black = 2
    @color_results = rand(1..2)
end

def table_odd_or_even
    odd = 1
    even = 2
    @odds_results = rand(1..2)
end

# def exit_game
#     puts "thank you for playing, your balance is #{balance}"
#     exit
# end 

# def display_display
#     display_dis
#     choice = gets.chomp.to_i
#     case choice
#     when 1
#         display_options
#     when 2 
#         Puts "your balance is #{balance}"
#     else 
#         exit_game
#     end
# end

def display_menu2
    puts "Please choose how you would like to bet"
    display_options
    choice = gets.chomp.to_i
    case choice
    when 1 
        puts "Would you like to bet on 1. Red or 2. Black?"
        color_choice = gets.chomp.to_i
        table_color
        if @color_results == color_choice
            puts "YOU WIN!"
            @bet *= 2
            @balance += @bet
            display_menu2
        else 
            puts "YOU LOSE.. TRY AGAIN!"
            @balance -= @bet
            display_menu2
        end
    when 2 
        puts "Would you like to bet on 1. Odds or 2. Even?"
        odds_choice = gets.chomp.to_i
        @table_odd_or_even
        if @odds_results == odds_choice
            puts "GREAT JOB!"
            @bet *= 2
            @balance += @bet
            display_menu2
        else
            puts "YOU LOSE.. TRY AGAIN!"
            @balance -= @bet
            display_menu2
        end
    when 3
        puts "What number 1-36 would you like to put your money on?"
        number_choice = gets.chomp.to_i
        table_number
        if @results == number_choice
            puts "ITS YOUR LUCKY DAY!"
            @bet *= 10
            @balance += @bet
            display_menu2
        else 
            puts "NO LUCK BOB.. TRY AGAIN!"
            @balance -= @bet
            display_menu2
        end
    when 4 
        puts "Your balance is $#{@balance}"
        display_main_menu
    else
        puts "Your balance was $#{@balance}"
    end
end

display_menu2
  when 4
    show_balance
    display_main_menu
  when 5
    leave_casino
    puts "THANK YOU COME AGAIN"
    exit
  else 
    puts "INVALID CHOICE"
    display_main_menu
  end 
end

display_main_menu
 