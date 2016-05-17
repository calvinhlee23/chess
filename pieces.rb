require 'singleton'

class Pieces
  attr_reader

  def initialize(board, current_position, color)
    @board = board
    @current_position = current_position
    @color = color
  end

  def moves(pos)
    #check for validity
    # @current_position = pos
    # update board with new_Position
  end




end


class NullPiece
  include Singleton

  #TODO - create new NullPiece w/ NullPiece.instance
  def color
    # create single color for nullpieces
  end

  def to_s
      " "
  end

end
