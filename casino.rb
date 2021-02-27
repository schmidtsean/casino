puts "What Is Your Name?"
name = gets.chomp
puts "How Much Would You Like To Add To Your Account?"
account = gets.chomp.to_f
puts "Hello #{name} your account total is $#{account}"

@wallet = account 

@menu = [
  {key:1, name: "SLOTS"}
  {key:2, name: 21}
  {key:3, name: "ROULETTE"}
  {key:4, name: "SHOW BALANCE"}
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

def display_menu
  puts "WHAT WOULD YOU LIKE TO PLAY?"
  display_options
  choice = gets.chomp.to_i
  case choice
  when 1
    display_slots_menu
  when 2
    display_21_menu
  when 3
    display_roulette_menu
  when 4
    show_balancef
  when 5
    leave_casino
    puts "THANK YOU COME AGAIN"
    exit
  else 
    puts "INVALID CHOICE"
    display_menu
  end 
end
 