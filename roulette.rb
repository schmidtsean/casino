puts "welcome to the Roulette table."
puts "how much would you like to bet?"
bet = gets.chomp.to_i
puts "would you like to bet on [color], [odd], [even], or [number] 1-36"
choice = gets.chomp.to_i
@display[
    {key:1, name: "lets play!"}
    {key:2, name: "im good"}
]
@menu [
    {key:1, name: "color"}
    {key:2, name: "odd or even"}
    {key:3, name: "number"}
]
def table_number
    results = rand(36)
    puts "#{results}"
end
def table_color
    color_results = rand("red" || "black")
    puts "#{color_results}"
end
def table_odd_or_even
    odds_results = rand(1.. 2)
    1 = odd
    2 = even
end
def display_display
    choice = gets.chomp.to_i
    case choice
    when 1
        display_options
    else 
        exit_store
    end
end
def display_options
    @menus.each_with_index do | menu, index |
    puts " #{menu[:key]}, #{menu[:name]}"
end
def bets
    choice = gets.chomp.to_i
    case choice
    when 1 
        puts " would you like to bet on red or black?"
        color_choice = gets.chomp 
        table_color
        if table_color = color_choice
            puts "YOU WIN!"
            balance *= 2
        else 
            puts "YOU LOSE.. TRY AGAIN!"
            display_display
        end
    when 2 
        puts "would you like to bet on odds or even?"
        odds_choice = gets.chomp
        table_odd_or_even
        if table_odd_or_even = odds_choice
            puts "GREAT JOB!"
            balance *= 2
        else
            puts "YOU LOSE.. TRY AGAIN!"
            display_display
        end
      end
end
  