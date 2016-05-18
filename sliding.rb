class SlidingPiece < Pieces
  attr_reader :current_position, :color, :board
  def initialize(board, current_position, color)
    super
  end

  # def move_dirs
  #   [[1,0],[-1,0],[0,1],[0,-1]]
  # end

  def moves
    pos = self.current_position
    moves = []
    move_dirs.each do |arr|
      @current_position = pos
      loop do
        @current_position = [@current_position[0] + arr[0], @current_position[1] + arr[1]]
        break if [@current_position[0], @current_position[1]].any? { |val| val < 0 || val > 7 }
        if board.pos_occupied?(@current_position)
          if @board[@current_position].color == self.color
            break
          else
            moves << @current_position
            break
          end
          moves << @current_position
        end
        moves << @current_position
      end
    end
    moves
  end

  def valid_position?(pos)
    self.move_dirs.include?(pos)
  end

end

class Bishop < SlidingPiece

  def initialize(board, current_position, color)
    super
  end

  def to_s
    " b "
  end

  # def make_bishop_moves
  #   bishop_moves = []
  #   8.times{|ind| bishop_moves << [ind, ind] }
  #   8.times{|ind| bishop_moves << [ind * (-1),ind] }
  #   8.times{|ind| bishop_moves << [ind * (-1), ind * (-1)] }
  #   8.times{|ind| bishop_moves << [ind, ind * (-1)] }
  #   bishop_moves
  # end

  def move_dirs
    [[1,1],[-1,1],[-1,-1],[1,-1]]
  end
  # def move_dirs
  #   moves = make_bishop_moves
  #   move_dirs =  []
  #   moves.each do |(x,y)|
  #     new_pos = [@current_position.first + x, @current_position.last + y]
  #     move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
  #   end
  #   move_dirs.uniq.reject { |pos| pos == @current_position }
  # end
end

class Rook < SlidingPiece


  def initialize(board, current_position, color)
    super
  end

  def move_dirs
    [[1,0],[-1,0],[0,1],[0,-1]]
  end

  def to_s
    " r "
  end

  # def move_dirs
  #   moves = make_rook_moves
  #   move_dirs =  []
  #   moves.each do |(x,y)|
  #     new_pos = [@current_position.first + x, @current_position.last + y]
  #     # debugger
  #     move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
  #   end
  #     move_dirs.uniq.reject { |pos| pos == @current_position }
  #
  # end
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

  def to_s
    " Q "
  end

  def move_dirs
    [[1,1],[-1,1],[-1,-1],[1,-1],[1,0],[-1,0],[0,1],[0,-1]]
  end

  # def move_dirs
  #   moves = make_queen_moves
  #   move_dirs =  []
  #   moves.each do |(x,y)|
  #     new_pos = [@current_position.first + x, @current_position.last + y]
  #     move_dirs << new_pos if new_pos.all? {|coord| coord.between?(0,7)}
  #   end
  #   move_dirs.uniq.reject { |pos| pos == @current_position }
  #
  # end
  # q = Queen.new(Board.new, [0,0])
end
