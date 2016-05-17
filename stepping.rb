require_relative 'pieces'
require_relative 'board'
class Stepping < Pieces
  def initialize(board, current_position)
    super
  end

  def moves(pos)
  end

end

class Knight<Stepping
  KNIGHT_MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]
  def initialize(board, current_position)
      super
  end

  def move_dirs
    move_dirs = []
    KNIGHT_MOVES.each do |(x,y)|
       new_pos = [@current_position[0]+ x, @current_position[1]+y]
       move_dirs << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
     end
     move_dirs.uniq.reject { |pos| pos == @current_position }
  end
end

class King < Stepping
  KING_MOVES = [[1,1],
  [1,-1],
  [-1,-1],
  [-1,1],
  [1,0],
  [-1,0],
  [0,1],
  [0,-1]
  ]
  def initialize(board, current_position)
    super
  end

  def move_dirs
    move_dirs = []
    KING_MOVES.each do |(x,y)|
      new_pos = [@current_position.first + x, @current_position.last + y]
      move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
    end
    move_dirs.uniq.reject { |pos| pos == @current_position }
  end
end

class Pawn
end
