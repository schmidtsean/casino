puts "What Is Your Name?"
name = gets.chomp
puts "How Much Would You Like To Add To Your Account?"
account = gets.chomp.to_f
puts "Hello #{name} your account total is $#{account}"

@wallet = account 

puts "WELCOME TO SLOTS!"
class Lever
  def initialize
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
end

def bet
  @wallet -= 1
end

def winnings
  if @slot_num1 == @slot_num2 && @slot_num2 == @slot_num3 && @slot_num1 == @slot_num3
    puts "GOOD JOB!!! YOU WON $100"
    @wallet += 100
  elsif @slot_num1 == @slot_num2 
    puts "YOU'RE ON FIRE!!! $10"
    @wallet += 10
  elsif @slot_num2 == @slot_num3
    puts "AWESOME!! $10"
    @wallet += 10
  else 
    puts "LOSER... TRY AGAIN!"
  end
end

def play_slots 
  puts "Enter $1 to spin"
  puts "Press 1.To Spin 2.To exit"
  choice = gets.chomp.to_i
  puts "_" * 20
  case choice
  when 1
    bet
    Lever.new
    winnings
    play_slots
    
  when 2
    puts "Your Balance Is $#{@wallet}"
    puts "Thank You For Playing!"
    display_menu
  end 
end
play_slots