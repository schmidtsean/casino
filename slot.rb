
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
start_slot