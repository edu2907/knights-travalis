require_relative 'move_tree'

class Knight
  def initialize(board)
    @board = board
  end

  def move(initial_pos, target_pos)
    if !(@board.coordinate_in_board?(initial_pos) && @board.coordinate_in_board?(target_pos))
      puts "Coordinates out of range! Be sure that the coordinates are between #{@board.x_axis}x#{@board.y_axis} board."
    elsif initial_pos == target_pos
      puts 'Coordinates are the same! Try again.'
    else
      moves_tree = MoveTree.new(initial_pos, @board)
      path = moves_tree.find_path(target_pos)
      puts "You made it in #{path.size} moves! Here's your path:"
      path.each { |node| p node }
    end
  end
end
