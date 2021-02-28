require "pry"

puts "What Is Your Name?"
name = gets.chomp
puts "How Much Would You Like To Add To Your Account?"
account = gets.chomp.to_f
puts "Hello #{name} your account total is $#{account}"

@wallet = account 

puts "WELCOME TO SLOTS!"

  def start_slot
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

def winnings #method doesnt work
  if @slot_num1 == @slot_num3 && @slot_num2 == @slot_num1 # when all numbers equal
    puts "YOU'RE ON FIRE!!! ALL THREE!!! $100"
    @wallet += 100
  elsif @slot_num2 == @slot_num3 #when number 2 and 3 equal
    puts "AWESOME!! $10"
    @wallet += 10
  elsif @slot_num1 == @slot_num3 #when number 1 and 3 equal
    puts "WOW!!! $10"
    @wallet += 10
  elsif @slot_num1 == @slot_num2 #when number 1 and 2 equal
    puts "SWEET!!! $10"
    @wallet += 10
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
    start_slot
    
    winnings
    play_slots
    
  when 2
    puts "Your Balance Is $#{@wallet}"
    puts "Thank You For Playing!"
    display_menu
  end 
end
play_slots