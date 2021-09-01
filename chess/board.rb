require_relative "pieces"

class Board
    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        make_starting_grid(fill_board)
    end

    def [](pos)  #board_1 [1,1]
        x,y = pos #x= 1, y= 1
        @rows[x][y] 
    end

    def []=(pos, value = nil)
        x,y = pos
        @rows[x][y] ||= Piece.new(:black, @rows, pos)
    end

    def move_piece(start_pos, end_pos, color) #:W, B
        #find start_pos has a piece
            # if true cannot move to end_point #[1,1]
        
        if self[end_pos] =
            raise "No available piece at position" 
        else
            self[end_pos] = self[start_pos]
            self[start_pos] = @null_piece
        end
    end

    def make_starting_grid(fill_board)
        board = Array.new(8){Array.new(8)}
        if fill_board #true
            (2..5).each do |i|
                board[i].map! do |ele|
                    ele = @sentinel
                end
            end
        end
       
        board.each do |sub_arr|
            sub_arr.map do |ele|
                if ele.nil?
                    el = 
                end
            end
        end
        p board
    end
end

board_1 = Board.new



