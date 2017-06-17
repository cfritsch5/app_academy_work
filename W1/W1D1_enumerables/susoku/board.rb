require_relative 'tile'
class Board

  attr_reader :grid
  def self.from_file
    grid = []
    File.foreach("sudoku_1.txt") do |line|
      tiles = []
      line.chars.each do |char|
        if char == "0"
          tiles << Tile.new(nil,true)
        else
          tiles << Tile.new(char.to_i, true)
        end
      end
      grid << tiles
    end
    grid
  end

  def initialize(grid = Board.from_file)
    @grid = grid
  end

  def print_board
    self.grid.each do |line|
      line.each do |tile|
        print tile.to_s
      end
      print "\n"
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.print_board
end
