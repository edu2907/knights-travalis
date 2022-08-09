class MoveTree
  def initialize(coordinate, board)
    @board = board
    @initial_node = MoveNode.new(coordinate)
    generate_next_moves(@initial_node)
  end

  def find_path(target_coordinate)
    path = []
    current_node = find(target_coordinate)
    until current_node.nil?
      path.unshift(current_node.coordinate)
      current_node = current_node.ancestor
    end
    path
  end

  private

  def find(coordinate)
    query = [@initial_node]
    until query.empty?
      node = query.shift
      return node if node.coordinate == coordinate

      generate_next_moves(node) if node.next_moves.all?(:nil?)
      node.next_moves.each { |move| query.push(move) unless move.nil? }
    end
  end

  def generate_next_moves(node)
    next_moves = calculate_next_moves(node.coordinate)
    node.next_moves = next_moves.map { |next_move| MoveNode.new(next_move, node) }
    node
  end

  def calculate_next_moves(coordinate)
    row = [2, 1, -1, -2, -2, -1, 1, 2, 2]
    col = [1, 2, 2, 1, -1, -2, -2, -1, 1]

    x, y = coordinate
    next_moves = []
    8.times do |i|
      next_move = [x + row[i], y + col[i]]
      next_moves.push(next_move) if @board.coordinate_in_board?(next_move)
    end
    next_moves
  end
end

class MoveNode
  attr_reader :coordinate, :ancestor
  attr_accessor :next_moves

  def initialize(coordinate, ancestor = nil)
    @coordinate = coordinate
    @ancestor = ancestor
    @next_moves = []
  end
end
