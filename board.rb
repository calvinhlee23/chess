require 'colorize'
require_relative 'cursorable'
require_relative 'pieces'
require_relative 'board'
require_relative 'display'
require 'byebug'


class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8){NullPiece.instance}}
  end

#TODO - fix rows (below) and get render working.
  def rows
    @board
  end

  def move(start, end_pos)
    raise "There's no piece there" unless pos_occupied?(start)
    # piece = @board[pos].piece
    raise "Your #{piece} can't move there." unless valid_move?(piece, end_pos)
  end

  def []=(pos, piece)
    x,y = pos
    @board[x][y] = piece
  end

  def pos_occupied?(pos)
    @board[pos].empty?
  end

  def valid_move?(piece, end_pos)
  end
end

l = Board.new
