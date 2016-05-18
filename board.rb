require_relative 'manifest.rb'

class Board
  attr_reader :grid

  #TODO

  def make_move(piece, move)
    # move piece
    old_pos = piece.current_position
    self[move] = piece
    self[old_pos] = NullPiece.instance
    # update piece.current_position w/ move
    piece.current_position = move
  end

  def initialize
    @grid = Array.new(8) { Array.new(8){NullPiece.instance}}
    # setup
  end

  def setup
    setup_pawns
    setup_royalty
    setup_bishops
    setup_knights
    setup_rooks
  end

  def setup_pawns
    8.times do |cdx|
      @grid[1][cdx] = Pawn.new(self, [1, cdx], :b)
      @grid[6][cdx] = Pawn.new(self, [6, cdx], :w)
    end
  end

  def setup_royalty
    @grid[7][3] = Queen.new(self, [7, 3], :w)
    @grid[7][4] = King.new(self, [7, 4], :w)
    @grid[0][3] = Queen.new(self, [0, 3], :b)
    @grid[0][4] = King.new(self, [0, 4], :b)
  end

  def setup_bishops
    @grid[0][2] = Bishop.new(self, [0, 2], :b)
    @grid[0][5] = Bishop.new(self, [0, 5], :b)
    @grid[7][5] = Bishop.new(self, [7, 5], :w)
    @grid[7][2] = Bishop.new(self, [7, 2], :w)
  end

  def setup_knights
    @grid[0][1] = Knight.new(self, [0, 1], :b)
    @grid[0][6] = Knight.new(self, [0, 6], :b)
    @grid[7][6] = Knight.new(self, [7, 6], :w)
    @grid[7][1] = Knight.new(self, [7, 1], :w)
  end

  def setup_rooks
    @grid[0][0] = Rook.new(self, [0, 0], :b)
    @grid[0][7] = Rook.new(self, [0, 7], :b)
    @grid[7][0] = Rook.new(self, [7, 0], :w)
    @grid[7][7] = Rook.new(self, [7, 7], :w)
  end


  def rows
    @grid
  end

  def in_check?(color)
    #iterate over the board and return color's king poistion
    king_pos = find_king(color)
    color == :w ? enemy_color = :b : enemy_color = :w
    #check all opposing color pieces moves to see if they contain king's current position
    pieces_of_color = pieces_of_color(enemy_color)
    #check every move of these pieces.
    pieces_moves = pieces_moves(pieces_of_color)
    #check if king's pos is included in enemy's moves
    pieces_moves.include?(king_pos)
  end

  def deep_dup
    # new_board = Array.new(8) { Array.new(8) }
    new_board = Board.new
    self.grid.each_with_index do |row, rdx|
      row.each_with_index do |col, cdx|
        piece = self.grid[rdx][cdx]
        new_board[[rdx,cdx]] = piece.dup unless piece.is_a?(NullPiece)
      end
    end
    new_board
  end

  def checkmate?(color) #TODO:comeback
    #has to be in_check now, else return false
    #check our moves:
    #1)deep dup board and pieces

    if in_check?(color)

    end
      false
  end



  def pieces_moves(enemy_pieces)
    list_moves = []
    enemy_pieces.each{|piece| list_moves += piece.moves}
    list_moves
  end

  def pieces_of_color(color)
    enemy_pieces = []
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        piece = @grid[row_idx][col_idx]
        if piece.is_a?(Pieces) && piece.color == color
          enemy_pieces << piece
        end
      end
    end
    enemy_pieces
  end

  def find_king(color)
    king_pos = []
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        piece = @grid[row_idx][col_idx]
        if piece.is_a?(King) && piece.color == color
          king_pos = [row_idx,col_idx]
        end
      end
    end
    king_pos
  end

  def checkmate?(color)
    #is king in check?
    return false unless in_check?(color)
    #look at color's remaining pieces to see if king can be protected.
    my_pieces = pieces_of_color(color)
    my_moves = []
    my_pieces.each do |piece|
      my_moves += piece.valid_moves
    end
    return true if my_moves.empty?
    # look at all of color's moves, are all of them in check?
    false
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end

  def move(start, end_pos)
    raise "There's no piece there" unless pos_occupied?(start)
    # piece = @grid[pos].piece
    raise "Your #{piece} can't move there." unless valid_move?(piece, end_pos)
  end

  def []=(pos, piece)
    x,y = pos
    @grid[x][y] = piece
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def pos_occupied?(pos)
    x,y = pos
    piece = @grid[x][y]
    piece.is_a?(Pieces)
  end

  def valid_move?(piece, end_pos)
  end
end
