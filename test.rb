require_relative 'manifest'

board = Board.new
board.setup
d = Display.new(board)
d.render

w_king = board[[7,4]]
board[[3,4]] = w_king
w_king.current_position=[3,4]
p w_king.current_position
p w_king.move_dirs
p w_king.valid_moves

# # piece = Pawn.new(board, [2,2], :w)
# # blocker_w= King.new(board,[1,2], :w)
# # blocker_b = King.new(board,[1,1], :b)
# #
# # d = Display.new(board)
# #
# # d.render
# newb = board.deep_dup
# old_p = board[[1, 0]]
# new_p = newb[[1, 0]]
# board[[3,0]] = old_p
# # p old_p
# # p new_p
# d = Display.new(board)
# dd = Display.new(newb)
# d.render
# dd.render
# # p newb

# ef move_into_check?(pos)
#   # dup board
#   new_board = self.deep_dup
#    # perform move
#   new_board.make_move(self, pos)
#   new_board.in_check?(self.color)
