require_relative '00_tree_node'
class KnightPathFinder
  def initialize(start_pos)
    @position = start_pos
    @visited_positions = [start_pos]
  end

  DELTA = [[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1]].freeze

  def self.valid_moves(pos)
    val_moves = DELTA.map do |delta|
      [ delta[0] + pos[0], delta[1] + pos[1] ]
    end

    val_moves.select do |ps|
      ps.all? { |coor| coor >= 0 }
    end
  end

  def new_move_positions(pos)
    new_pos = valid_moves(pos).reject do |ps|
      @visited_positions.include?(ps)
    end

    @visited_positions += new_pos
    new_pos
  end

  def build_move_tree

  end

  def find_path(pos)

  end


end

if __FILE__ == $PROGRAM_NAME
  p KnightPathFinder.valid_moves([0,0])
end
