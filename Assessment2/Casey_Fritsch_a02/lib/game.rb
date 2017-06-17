require_relative './ai_player'

class Game
  # ::deal_in_players is a factory method that:
  # 1) Takes in an array of cards
  # 2) deals cards in an alternating pattern & creates 2 AIPlayers
  # 3) return instance of Game
  def self.deal_in_players(deck)
    pile1, pile2 = [],[]
    until deck.empty?
      pile2 << deck.take_card
      pile1 << deck.take_card
    end

    Game.new( AIPlayer.new(pile1), AIPlayer.new(pile2) )
  end

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # call do_battle until game is over
  def play
    unless game_over?
       do_battle
    end
  end

  # 1. Players each take their top card
  # 2. If the cards' rank is the same, first, take an additional card
  #    prisoner from each player. Then, repeat #do_battle.
  # 3. If the last drawn cards are different ranks, all the cards drawn in
  #    this round are awarded to the drawer of the higher ranked card.
  def do_battle(prisoners = [])
    #return if game_over?
    card1 = @player1.take_card
    card2 = @player2.take_card
    # prisoners << card1
    # prisoners << card2
    # case card1.rank <=> card2.rank
    # when 0
    #   prisoners << @player1.take_card
    #   prisoners << @player2.take_card
    #   do_battle(prisoners)
    # when -1
    #   @player1.add_cards(prisoners)
    # when 1
    #   @player1.add_cards(prisoners)
    #
    # end

    if card1.rank > card2.rank
      @player1.give_won_cards([card1, card2])
    elsif card2.rank > card1.rank
      @player2.give_won_cards([card1, card2])
    end


  end

  # if either of the players has run out of cards, the game is over
  def game_over?
    @player1.out_of_cards? || @player2.out_of_cards?
  end
end
