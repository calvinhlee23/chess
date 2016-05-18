class Stepping < Pieces
  attr_reader :current_position, :color
  def initialize(board, current_position, color)
    super
  end

  def moves
    #get all the potential moves
    #check if there piece in each potential move => @board.pos_occupied?(pos)
    #if there is a piece, we want to check the color of the piece in that move
    #if different color, this pos goes into valid_moves, else filter it out.
    possible_moves = self.move_dirs
    valid_moves = []

    possible_moves.each do |move|

      if @board.pos_occupied?(move)
        valid_moves << move unless get_color(move) == @color
      else
        valid_moves << move
      end
    end
    valid_moves
  end



  def get_color(pos)
    @board[pos].color
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
  def initialize(board, current_position, color)
      super
  end

  def to_s
    " h "
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
  def initialize(board, current_position, color)
    super
  end

  def to_s
    " K "
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

class Pawn < Pieces
  def initialize(board, current_position, color)
    super
  end

  def to_s
    " p "
  end

  def move_dirs
    return [[1, 0],[1,1],[1,-1]] if @color == :b
    return [[-1, 0],[-1,-1],[-1,1]] if @color == :w
  end

  def moves
    pos = @current_position
    possible = move_dirs
    moves = []
    # debugger
    possible.each do |x,y|
      checking = [pos.first+x, pos.last+y]
      # debugger
      if @board.pos_occupied?(checking) && y != 0
        if @board[checking].color == self.color
          next
        else
          moves << checking
        end
      elsif @board.pos_occupied?(checking) && y == 0
        next
      elsif y == 0
        moves << checking
      # elsif y != 0
      #
      end
    end
    moves
  end


end
