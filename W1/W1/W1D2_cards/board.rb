require_relative 'card.rb'

class Board
  attr_reader :cards, :board

  def initialize(size = 4)
    @board = Array.new(size) { Array.new(size) }
    populate(size)
  end

  def create_deck(size)
    deck = []
    size.times do
      (size).times { |i| deck << Card.new(i.to_s) }
    end
    deck
  end

  def populate(size)
    deck = create_deck(size)
    shuffled_cards = (deck).shuffle
    @board.each_index do |row|
      @board[0].each_index do |col|
        @board[row][col] = shuffled_cards.pop #refactor later
      end
    end
  end

  def render
    @board.each do |line|
      line.each do |card|
        print "#{card.to_s} "
      end
      puts
    end
  end

  def won?
    @board.any? do |line|
      line.any? do |card|
        return false if card.facing == "[X]"
      end
    end
    true
  end

  def reveal(pos)
    card = self[pos]
    card.reveal if card.facing == "[X]"
  end

  def hide(pos)
    card = self[pos]
    card.hide unless card.facing == "[X]"
  end

  def [](pos)
    row,col = pos
    @board[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @board[row][col] = val
  end

end

if __FILE__ == $PROGRAM_NAME
  #run stuff
  b = Board.new
  b.render
end
