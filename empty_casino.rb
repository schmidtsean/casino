@balance = 100
puts "welcome to the Roulette table. your balance is $#{@balance}"
puts "How much would you like to bet?"
@bet = gets.chomp.to_i

@menu =[
    {key:1, name: "Color"},
    {key:2, name: "Odd or even"},
    {key:3, name: "Number"},
    {key:4, name: "View balance?"}
]

@wallet =[ 
    @balance += @bet
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

def display_menu
    puts "Please choose how you would like to bet"
    display_options
    choice = gets.chomp.to_i
    case choice
    when 1 
        puts "Would you like to bet on 1 Red or 2 Black?"
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
        puts "Would you like to bet on Odds or Even?"
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
        puts "What number 1-36 would you like to put your money on?"
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
        puts "Your balance is $#{@balance}"
        display_menu
    else
        puts "Your balance was $#{@balance}"
    end
end

display_menu
