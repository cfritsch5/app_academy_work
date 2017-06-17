class Game
  attr_reader :deck, :players

  def initialize(players, deck = Deck.new, deal = true)
    # ...
    @players = players
    @deck = deck
    deal_players_in if deal
  end

  def deal_players_in
    # DO NOT MODIFY
    players.each { |player| player.take(deck.deal(7)) }
  end

  # switch the current player
  def next_player!
    @players.rotate!
  end

  def current_player
    @players[0]
  end

  # returns all non-current players
  def other_players
    @players[1..-1]
  end

  def play
    until game_over?
      play_turn
    end

    puts "#{winner.name} wins!"
  end

  # If the current player receives cards, they take another turn (that is, this
  # method returns without passing the turn to the next player). Otherwise, the
  # current player has to "go fish" and the turn passes to the next player.
  def play_turn
    card_val, player = current_player.make_request(other_players)

    if player.has_value?(card_val)
      current_player.take(player.give_up(card_val))
    else
      current_player.go_fish(@deck)
      next_player!
    end

  end

  def game_over?
    play_on = @players.any? do |player|
      player.in_play?
    end

     @deck.empty? || play_on
  end

  def winner
    max_books = 0
    winner = nil
    @players.each do |player|
      if player.books > max_books
        max_books = player.books
        winner = player
      end
    end
    winner
  end
end
