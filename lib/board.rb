class Board
  attr_reader :x_axis, :y_axis

  def initialize(board_size)
    @x_axis = board_size[0]
    @y_axis = board_size[1]
  end

  def coordinate_in_board?(coordinate)
    x, y = coordinate
    (0..x_axis).include?(x) && (0..y_axis).include?(y)
  end
end
