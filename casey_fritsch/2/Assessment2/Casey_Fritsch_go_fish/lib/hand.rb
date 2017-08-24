class Hand
  attr_reader :books, :cards

  def initialize(cards = [])
    @cards = cards
    @books = 0
  end

  def include?(value)
    @cards.any? do |card|
      card.value == value
    end
  end

  def empty?
    @cards.empty?
  end

  def count
    @cards.length
  end

  def give_up(value)
    return [] if @card.include?(value)
    to_give = []
    card_deck = @cards.dup
    card_deck.each do |card|
      if card.value == value
        to_give << card
        @cards.delete(card)
      end
    end
    to_give
  end

  def receive(new_cards)
    @cards += cards
  end

  # # This method isn't tested, but we strongly recommend you implement it as a
  # # helper method. It should return a hash mapping values to the number of
  # # matching cards in the hand (e.g., { king: 2, deuce: 3 })
  # def count_sets
  # end
  #
  def play_books
    @cards.dup.each do |card|
      
    end
  end

end
