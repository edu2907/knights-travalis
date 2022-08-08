require_relative 'move_tree'

class Knight
  def initialize(board)
    @board = board
  end

  def move(initial_pos, target_pos)
    moves_tree = MoveTree.new(initial_pos, @board)
    path = moves_tree.find_path(target_pos)
    puts "You made it in #{path.size} moves! Here's your path:"
    path.each { |node| p node.coordinate }
  end
end
