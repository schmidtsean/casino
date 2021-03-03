class Roulette
@balance = 100
puts "welcome to the Roulette table. your balance is #{@balance}"
puts "your balance is #{@balance}"
puts "how much would you like to bet?"
@bet = gets.chomp.to_i
@menu =[
    {key:1, name: "color"},
    {key:2, name: "odd or even"},
    {key:3, name: "number"},
    {key:4, name: "view balance?"},
    {key:5, name: "Back to Main Menu"}
]
@wallet =[ 
    @balance += @bet
]

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

def display_menu
    puts "please choose how you would like to bet"
    display_options
    choice = gets.chomp.to_i
    case choice
    when 1 
        puts " would you like to bet on 1. red or 2. black?"
        color_choice = gets.chomp.to_i
        table_color
        if @color_results == color_choice
            puts "YOU WIN!"
            @bet *= 2
            @balance += @bet
            display_menu
        else 
            puts "YOU LOSE.. TRY AGAIN!"
            @balance -= @bet
            display_menu
        end
    when 2 
        puts "would you like to bet on 1. odds or 2. even?"
        odds_choice = gets.chomp.to_i
        @table_odd_or_even
        if @odds_results == odds_choice
            puts "GREAT JOB!"
            @bet *= 2
            @balance += @bet
            display_menu
        else
            puts "YOU LOSE.. TRY AGAIN!"
            @balance -= @bet
            display_menu
        end
    when 3
        puts "what number 1-36 would you like to put your money on?"
        number_choice = gets.chomp.to_i
        table_number
        if @results == number_choice
            puts "ITS YOUR LUCKY DAY!"
            @bet *= 10
            @balance += @bet
            display_menu
        else 
            puts "NO LUCK BOB.. TRY AGAIN!"
            @balance -= @bet
            display_menu
        end
    when 4 
        puts "your balance is #{@balance}"
        display_menu
    else
        puts "your balance was #{@balance}"
    end
    #add way to get back to main menu
  
end
end