class Player
  attr_reader :hand, :name

  def initialize(name, hand = Hand.new)
    @name = name
    @hand = hand
    @books = 0
  end

  def books
    @hand.books
  end

  def take(cards)
    @hand.receive(cards)
    play_books
  end

  def give_up(value)
    @hand.give_up(value)
  end

  def has_value?(value)
    @hand.include?(value)
  end

  def go_fish(deck)
    take(deck.deal(1))
  end

  def play_books
    @hand.play_books
  end

  # returns a value and a target player
  def make_request(other_players)
    val = choose_value
    player = choose_player(other_players)
    [val, player]
  end

  def in_play?
    !@hand.empty?
  end

  # Don't implement these last two methods; normally we would define these
  # inside of HumanPlayer and ComputerPlayer classes.

  def choose_player(other_players)
    # DO NOT IMPLEMENT
  end

  def choose_value
    # DO NOT IMPLEMENT
  end
end
