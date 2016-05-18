
class Pieces
  attr_reader :current_position, :color, :board
  attr_writer :current_position

  def initialize(board, current_position, color)
    @board = board
    @current_position = current_position
    @color = color
  end

  def valid_moves
    #self.moves
    valid_moves = []
    self.moves.each do |move|
      valid_moves << move unless move_into_check?(move)
    end
    valid_moves
  end

  def move_into_check?(pos)
    # dup board
    new_board = self.board.deep_dup
     # perform move
    new_board.make_move(self, pos)
    new_board.in_check?(self.color)
  end
end

class NullPiece
  include Singleton

  #TODO - create new NullPiece w/ NullPiece.instance
  def color
    # create single color for nullpieces
  end

  def to_s
      "   "
  end

end
