require_relative 'lib/board'
require_relative 'lib/knight'

board = Board.new
knight = Knight.new(board)
knight.move([0, 0], [2, 1])
knight.move([0, 0], [7, 7])
