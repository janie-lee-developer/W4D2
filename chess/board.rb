require_relative "piece"
class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
        @null_piece = NullPiece.new
    end

    def [](pos)  #board_1 [1,1]
        x,y = pos #x= 1, y= 1
        @rows[x][y] 
    end

    def []=(pos, value = nil)
        x,y = pos
        @rows[x][y] ||= Piece.new(:black, @rows, pos)
    end

    def move_piece(start_pos, end_pos)
        #find start_pos has a piece
            # if true cannot move to end_point
        if self[start_pos].nil? 
            raise "No available piece" 
        else
         self[end_pos] = self[start_pos]
         self[start_pos] = @null_piece
        end

    end

end

board_1 = Board.new

p board_1[[5,6]]
p board_1.move_piece([2,0],[3,4])