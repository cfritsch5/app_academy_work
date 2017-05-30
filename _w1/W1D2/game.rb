require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'humanplayer.rb'
require_relative 'computerplayer.rb'

class Game
attr_reader :board, :guessed_pos, :previous_guess, :player

  def initialize(size)
    @board = Board.new(size)
    @previous_guess = nil
    @guessed_pos = nil
    @player = HumanPlayer.new
  end

  def play
    until game_over?
      render
      make_guess
    end
    puts 'You won'
  end

  def game_over?
    board.won?
  end

  def render
    board.render
  end



  def make_guess
    @previous_guess = player.prompt
    reveal(previous_guess)

    @guessed_pos = player.prompt
    reveal(guessed_pos)

    unless board[previous_guess] == board[guessed_pos] # previous_guess == guessed_pos
      sleep(5)
      hide(previous_guess, guessed_pos)
    end

  end

  def reveal(guess)
    board.reveal(guess)
    render
  end

  def hide(previous_guess, guessed_pos)
    system("clear")
    board.hide(previous_guess)
    board.hide(guessed_pos)
  end

end


if __FILE__ == $PROGRAM_NAME
  #run stuff
  g = Game.new(2)
  g.play
end
