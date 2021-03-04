class Roulette

    def start_game

    end

  def display_options_roulette
      @menu_roulette =[
      {key:1, name: "Color"},
      {key:2, name: "Odd or even"},
      {key:3, name: "Number"},
      {key:4, name: "View balance?"},
      {key:5, name: "Exit"}
  ]

      @menu_roulette.each_with_index do | menu, index |
          puts "#{menu[:key]}, #{menu[:name]}"
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

  def display_menu2
      @app = App.new
      puts "welcome to the Roulette table. your balance is $#{$wallet}"
      puts "Please choose how you would like to bet"
      display_options_roulette
      choice = gets.chomp.to_i
      case choice
      when 1 
        puts "How much would you like to bet?"
        @bet = gets.chomp.to_i
          puts "Would you like to bet on 1. Red or 2. Black?"
          color_choice = gets.chomp.to_i
          table_color
          if @color_results == color_choice
              puts "YOU WIN!"
              @bet *= 2
              $wallet += @bet
              display_menu2
          else 
              puts "YOU LOSE.. TRY AGAIN!"
              $wallet -= @bet
              display_menu2
          end
      when 2 
        puts "How much would you like to bet?"
        @bet = gets.chomp.to_i
          puts "Would you like to bet on 1. Odds or 2. Even?"
          odds_choice = gets.chomp.to_i
          @table_odd_or_even
          if @odds_results == odds_choice
              puts "GREAT JOB!"
              @bet *= 2
              $wallet += @bet
              display_menu2
          else
              puts "YOU LOSE.. TRY AGAIN!"
              $wallet -= @bet
              display_menu2
          end
      when 3
        puts "How much would you like to bet?"
        @bet = gets.chomp.to_i
          puts "What number 1-36 would you like to put your money on?"
          number_choice = gets.chomp.to_i
          table_number
          if @results == number_choice
              puts "ITS YOUR LUCKY DAY!"
              @bet *= 10
              $wallet += @bet
              display_menu2
          else 
              puts "NO LUCK BOB.. TRY AGAIN!"
              $wallet -= @bet
              display_menu2
          end
      when 4 
          puts "Your balance is $#{$wallet}"
          display_menu2
      when 5
          puts "THANK YOU COME AGAIN"
          @app.display_main_menu
      else
          puts "INVALID CHOICE"
          display_menu2
      end
  end

end