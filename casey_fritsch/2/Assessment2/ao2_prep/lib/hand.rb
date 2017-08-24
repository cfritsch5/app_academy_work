class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    ace = false
    @cards.each do |card|
      begin
        points += card.blackjack_value
      rescue "ace has special value"
        ace = true
      end
      if ace && points <= 10
        points += 11
      else
        points += 1
      end
    end
    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    deck.take(1) if busted?
  end

  def beats?(other_hand)
    if busted?
      return false
    else
      self > other_hand.points?
    end
  end

  def return_cards(deck)
    deck.return(@cards.shift(@cards.length))
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
