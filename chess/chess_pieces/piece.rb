class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    symbol
  end

  def symbol
    " "
  end

  def empty?
    false
  end

  def valid_moves
    possible_moves = moves
    moves = possible_moves.reject { |move| move_into_check?(move) }
    moves
  end

  private
  def move_into_check?(end_pos)
    dupe_board = Marshal.load(Marshal.dump(board))
    dupe_board.move_piece!(pos, end_pos)
    dupe_board.in_check?(color)
  end

  def other_color
    color == :white ? :black : :white
  end
end



# class Piece
    
#     def initialize(color, board, pos)
#         @color = color
#         @board = board
#         @pos = pos
#     end

#     def to_s

#     end

#     def moves
#         #returns an array of pos
#         #each sub-classes have different way of moves
#         #each sub_classes have their own symbol.


#     end
    
# end

