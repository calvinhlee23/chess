require 'colorize'
require_relative 'cursorable'
require_relative 'pieces'
require_relative 'board'
require_relative 'display'
require 'byebug'

class SlidingPiece < Pieces

  def initialize(board, current_position, color)
    super
  end

  def moves(pos)
    valid_position(pos)?
    #now check if this pos is a valid position on the board.
  end

  def valid_position?(pos)
    self.move_dirs.include?(pos)
  end



end

class Bishop < SlidingPiece

  def initialize(board, current_position, color)
    super
  end

  def make_bishop_moves
    bishop_moves = []
    8.times{|ind| bishop_moves << [ind, ind] }
    8.times{|ind| bishop_moves << [ind * (-1),ind] }
    8.times{|ind| bishop_moves << [ind * (-1), ind * (-1)] }
    8.times{|ind| bishop_moves << [ind, ind * (-1)] }
    bishop_moves
  end

  def move_dirs
    moves = make_bishop_moves
    move_dirs =  []
    moves.each do |(x,y)|
      new_pos = [@current_position.first + x, @current_position.last + y]
      move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
    end
    move_dirs.uniq.reject { |pos| pos == @current_position }
  end
end

class Rook < SlidingPiece

  def make_rook_moves
    rook_moves = []
    8.times{|ind| rook_moves << [ind,0]}
    8.times{|ind| rook_moves << [ind*(-1),0]}
    8.times{|ind| rook_moves << [0,ind]}
    8.times{|ind| rook_moves << [0,ind*(-1)]}
    rook_moves
  end
  # r = Rook.new(Board.new, [1,0])
  def initialize(board, current_position, color)
    super
  end

  def move_dirs
    moves = make_rook_moves
    move_dirs =  []
    moves.each do |(x,y)|
      new_pos = [@current_position.first + x, @current_position.last + y]
      # debugger
      move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
    end
    move_dirs.uniq.reject { |pos| pos == @current_position }
  end
end

class Queen < SlidingPiece
  def initialize(board,current_position, color)
    super
  end

  def make_queen_moves
    queen_moves = []
    8.times{|ind| queen_moves << [ind,0]}
    8.times{|ind| queen_moves << [ind*(-1),0]}
    8.times{|ind| queen_moves << [0,ind]}
    8.times{|ind| queen_moves << [0,ind*(-1)]}
    8.times{|ind| queen_moves << [ind, ind] }
    8.times{|ind| queen_moves << [ind * (-1),ind] }
    8.times{|ind| queen_moves << [ind * (-1), ind * (-1)] }
    8.times{|ind| queen_moves << [ind, ind * (-1)] }
    queen_moves
  end

  def move_dirs
    moves = make_queen_moves
    move_dirs =  []
    moves.each do |(x,y)|
      new_pos = [@current_position.first + x, @current_position.last + y]
      move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
    end
    move_dirs.uniq.reject { |pos| pos == @current_position }

  end
  # q = Queen.new(Board.new, [0,0])
end
