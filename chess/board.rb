class Board
    def initialize
        @rows = Array.new(8){Array.new(8)}
        @null_piece = NullPiece.new
    end

    def [](pos)  #board_1 [1,1]
        x,y = pos #x= 1, y= 1
        @rows[x][y]
    end

    def []=(pos, value)
        x,y = pos
        @rows[x][y] = value
    end

    def move_piece(color, start_pos, end_pos)
        
    end
end
