require_relative 'lib/knight'
require_relative 'lib/board'

def valid_size?(size)
  size == '' || size.match?(/\A\d+x\d+\z/)
end

def valid_coordinate?(coord)
  coord.match?(/\A\d+\s\d+\z/)
end

size_input = ''
loop do
  puts 'Insert the board size: (Ex: "16x3")'
  print '(default=7x7) > '
  size_input = gets.chomp
  break if valid_size?(size_input)

  puts 'Invalid size! Try again.'
end

size_input = '7x7' if size_input == ''
board_size = size_input.split('x').map(&:to_i)
board = Board.new(board_size)
knight = Knight.new(board)

loop do
  puts 'Insert the coordinates for the knight\'s movement: (or type ! to finish the program)'
  puts 'Ex: "2 3"'
  print 'Initial coordinate: '
  initial_input = gets.chomp
  break if initial_input == '!'

  print 'Target coordinate: '
  target_input = gets.chomp
  break if target_input == '!'

  if valid_coordinate?(initial_input) && valid_coordinate?(target_input)
    initial_coord = initial_input.split(' ').map(&:to_i)
    target_coord = target_input.split(' ').map(&:to_i)
    knight.move(initial_coord, target_coord)
  else
    puts 'Invalid coordinates! Try again.'
  end
end
