class MoveTree
  def initialize(coordinate, board)
    @board = board
    @current_pos = build_move_tree(coordinate)
  end

  def find_path(target_coordinate)
    target = find(target_coordinate)
    path = [target]
    for pos in path
      path << pos.ancestor unless pos.ancestor.nil?
    end
    path.reverse
  end

  private

  def find(coordinate)
    query = [@current_pos]
    until query.empty?
      pos = query.shift
      return pos if pos.coordinate == coordinate

      generate_next_moves(pos) if pos.next_moves.all?(:nil?)
      pos.next_moves.each { |move| query.push(move) unless move.nil? }
    end
  end

  def build_move_tree(coordinate)
    root_pos = MoveNode.new(coordinate)
    generate_next_moves(root_pos)
  end

  def generate_next_moves(current_pos)
    next_moves = calculate_next_moves(current_pos.coordinate)
    current_pos.next_moves = next_moves.map { |next_move| MoveNode.new(next_move, current_pos) }
    current_pos
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

  def initialize(pos, ancestor = nil, moves = [])
    @coordinate = pos
    @ancestor = ancestor
    @next_moves = moves
  end
end
