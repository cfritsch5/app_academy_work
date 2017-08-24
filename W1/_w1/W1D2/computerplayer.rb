require_relative 'game.rb'

attr_reader :memory_board, :size
def ComputerPlayer
  def initialize(size)
    @size = size
    @turn_count = 0
    @memory_board = Array.new(size) { Array.new (size) }
  end

  def prompt
    @turn_count += 1
    if ready_to_guess
      next_guess = matches[0]
      guess_positions(next_guess)
    else
      guess = random_guess
      unless memory_board[guess]
        guess = random_guess
      end
    end
  end

  def turn
    @turn_count = 0 if turn_count == 3
  end

  def ready_to_guess
    matches.empty?
  end

  def guess_positions(next_guess)
    guess_positions = []
    @memory_board.each_index do |row|
      @memory_board[0].each_index do |col|
        if @memory_board[row][col] == next_guess
          guess_positions << [row,col]
        end
      end
    end
  end

  def matches
    matches = []
    size.times do |card|
      if memory_board.flatten.count(card) == 2
        matches << card
      end
    end
    matches.reject {|card| correct.include?(card)}
  end

  def random_guess
    row = rand(size)
    col = rand(size)
    [row, col]
  end

  def [](pos)
    row,col = pos
    @memory_board[row][col]
  end

  def []=(pos,val)
    row, col = pos
    @memory_board[row][col] = val
  end

end
