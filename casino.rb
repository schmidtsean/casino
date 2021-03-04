require_relative 'blackjack'
require_relative 'slots'
require_relative 'roulette'

class App

  puts "What Is Your Name?"
  name = gets.chomp
  puts "How Much Would You Like To Add To Your Account?"
  account = gets.chomp.to_f
  puts "Hello #{name} your account total is $#{account}"

  $wallet = account 

  def display_options
    @menu = [
    {key:1, name: "SLOTS"},
    {key:2, name: "21 (BLACKJACK)"},
    {key:3, name: "ROULETTE"},
    {key:4, name: "SHOW BALANCE"},
    {key:5, name: "EXIT"}
  ]
    @menu.each_with_index do | menu, index|
      puts " #{menu[:key]}, #{menu[:name]}"
    end
  end

  def show_balance
    puts "Your Balance Is $#{$wallet}"
  end

  def display_main_menu
    puts "WHAT WOULD YOU LIKE TO PLAY?"
    display_options
    choice = gets.chomp.to_i
    case choice
    when 1
      @slots = Slots.new
      @slots.play_slots
    when 2
      @blackjack = Blackjack.new
      @blackjack.blackjack_game
    when 3
      @roulette = Roulette.new
      @roulette.display_menu2
    when 4
      show_balance
      display_main_menu
    when 5
      puts "THANK YOU COME AGAIN"
      exit
    else 
      puts "INVALID CHOICE"
      display_main_menu
    end 

  end

end

@app = App.new
@app.display_main_menu
