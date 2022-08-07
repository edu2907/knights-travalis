class Knight
  def initialize(board)
    @board = board
  end

  def move(current_pos, target_pos)
    moves_tree = KnightMoves.new(current_pos)
    moves_tree.print_coordinates
  end
end

class KnightMoves
  def initialize(coordinate)
    @current_pos = build_move_tree(coordinate)
  end

  def print_coordinates
    query = [@current_pos]
    until query.empty?
      p query.first.pos
      query.first.moves.each { |move| query.push(move) unless move.nil? }
      query.shift
    end
  end

  private

  def build_move_tree(coordinate)
    root_pos = KnightPos.new(coordinate)
    next_moves = calculate_next_moves(coordinate)
    root_pos.moves = next_moves.map { |next_move| KnightPos.new(next_move) }
    root_pos
  end

  def calculate_next_moves(coordinate)
    row = [2, 1, -1, -2, -2, -1, 1, 2, 2]
    col = [1, 2, 2, 1, -1, -2, -2, -1, 1]

    x, y = coordinate
    next_moves = []
    8.times { |i| next_moves[i] = [x + row[i], y + col[i]] }
    next_moves
  end
end

class KnightPos
  attr_reader :pos
  attr_accessor :moves

  def initialize(pos, moves = [])
    @pos = pos
    @moves = moves
  end
end
