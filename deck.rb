require_relative 'cards'

class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    @my_hand = []
    @dealer_hand = []
    generate_deck
  end
 
  def shuffle_cards
   @cards.shuffle
  end
  
  def generate_deck
    @suits.each do |suit|
      @ranks.size.times do |i|
        # Ternary Operator
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
        @cards << Card.new(@ranks[i], suit, color)
      end
    end
  end
 
   def display_cards
     @cards.shuffle.each_with_index do |card,i|
       puts "#{card.rank} #{card.suit} (#{card.color})"
     end
   end

  def draw_card
    @cards.sample(1).each_with_index do |card, i|
      @my_hand << card
      @cards.delete(card)
    end
  end

  def draw_card_dealer
    @cards.sample(1).each_with_index do |card, i|
      @dealer_hand << card
      @cards.delete(card)
    end
  end

  def display_my_hand
    puts "My Hand:"
    @my_hand.each do |card|
      puts "#{card.rank} #{card.suit} (#{card.color})"
    end
    puts "\n"
  end

  def show_dealer_1st_card
    puts "Dealer's First Card:"
    puts "#{@dealer_hand[0].rank} #{@dealer_hand[0].suit} (#{@dealer_hand[0].color})"
    puts "\n"
  end

  def display_dealer_hand
    puts "Dealer Hand:"
    @dealer_hand.each do |card|
      puts "#{card.rank} #{card.suit} (#{card.color})"
    end
    puts "\n"
  end

  def show_card_values
    total = [0,0]
    @my_hand.each do |card|
      if card.rank.is_a? Integer
        total[0] += card.rank
        total[1] += card.rank
      elsif card.rank.is_a? String
        if card.rank != 'A'
          total[0] += 10
          total[1] += 10
        else card.rank == 'A'
          total[0] += 1
          total[1] += 11
        end
      else
        puts "Invalid values, please try again"
      end
    end
      
    if total[0] == total[1]
      @total_choice = total[0]
    else 
      puts "You have an Ace!\nPick one of two options for your final amount: 1) #{total[0]} 2) #{total[1]}"
      choice = gets.chomp.to_i
      @total_choice = total[choice - 1]
    end
  
    puts "Your total amount of points is: #{@total_choice}"
    puts "\n"
    return @total_choice
  end

  def show_card_values_dealer
    @total_choice = 0
    until @total_choice >= 17
      total = [0,0]
      @dealer_hand.each do |card|
        if card.rank.is_a? Integer
          total[0] += card.rank
          total[1] += card.rank
        elsif card.rank.is_a? String
          if card.rank != 'A'
            total[0] += 10
            total[1] += 10
          else
            total[0] += 1
            total[1] += 11
          end
        else
          puts "Invalid values, please try again"
        end
      end

      if total[0] == total[1]
        @total_choice = total[0]
      else 
        if total[1] >= 17 && total[1] <= 21
          @total_choice = total[1]
        else
          @total_choice = total[0]
        end
      end

      if @total_choice < 17
        draw_card_dealer
      end

    end
    return @total_choice
  end

end


 


 