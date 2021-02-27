require_relative 'cards'

class Deck
  # Getter and Setter methods for rank, suit and color
  attr_accessor :cards
 
  # Gets called when you call the new method to create an instance
  # deck = Deck.new
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
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
  end

  def show_dealer_1st_card
    puts "Dealer's First Card:"
    puts "#{@dealer_hand[0].rank} #{@dealer_hand[0].suit} (#{@dealer_hand[0].color})"
  end

end
 


 