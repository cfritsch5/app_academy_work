require_relative './ai_player'
class Pile
  def initialize(cards)
    @cards = cards
  end

  # return the top (last) card and remove it from pile
  def take_card
    raise OutOfCardsError if @cards == []#if empty?
    card = @cards[-1]
    @cards.pop
    card
  end

  # returns true if the pile is empty
  def empty?
    @cards.empty?
  end

  # add cards to the bottom (beginning) of pile
  def add_cards(new_cards)
    if new_cards.is_a? Array
      @cards = new_cards.concat(@cards)
    else
      @cards = [new_cards].concat(@cards)
    end
  #  @cards = new_cards.concat(@cards)
  #  p @cards
    #@cards.unshift(new_cards)
    #@cards += new_cards
  end
end
