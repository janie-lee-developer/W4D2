require_relative "nullpiece"
require_relative "pieces/rook_bishop_queen"
module Slideable

end

module Stepable

end

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s

    end

    def moves
        #returns an array of pos
        #each sub-classes have different way of moves
        #each sub_classes have their own symbol.


    end
    
end

