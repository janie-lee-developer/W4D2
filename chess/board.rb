require_relative 'pieces/all_pieces'

class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) { NullPiece.instance } }
        place_pieces
    end

    def place_pieces
        8.times do |i|
            self[[1,i]] = Pawn.new(:white, self, [1,i])
            self[[6,i]] = Pawn.new(:black, self, [6,i])
        end
        self[[0,0]] = Rook.new(:white, self, [0,0])
        self[[0,7]] = Rook.new(:white, self, [0,7])
        self[[7,0]] = Rook.new(:black, self, [7,0])
        self[[7,7]] = Rook.new(:black, self, [7,7])
        self[[0,1]] = Knight.new(:white, self, [0,1])
        self[[0,6]] = Knight.new(:white, self, [0,6])
        self[[7,1]] = Knight.new(:black, self, [7,1])
        self[[7,6]] = Knight.new(:black, self, [7,6])
        self[[0,2]] = Bishop.new(:white, self, [0,2])
        self[[0,5]] = Bishop.new(:white, self, [0,5])
        self[[7,2]] = Bishop.new(:black, self, [7,2])
        self[[7,5]] = Bishop.new(:black, self, [7,5])
        self[[0,3]] = Queen.new(:white, self, [0,3])
        self[[7,3]] = Queen.new(:black, self, [7,3])
        self[[0,4]] = King.new(:white, self, [0,4])
        self[[7,4]] = King.new(:black, self, [7,4])
    end

    def render
        8.times do |i|
            puts @rows[7-i].join(" ")
        end
    end

    def [](position)
        row, col = position
        @rows[row][col]
    end

    def []=(position, value)
        row, col = position
        @rows[row][col] = value
    end

    def valid_pos?(pos)
        pos.all? { |i| i.between?(0,7) }
    end

    def move_piece(start_pos, end_pos)
        raise "no piece here" if self[start_pos].empty?
        moves = self[start_pos].valid_moves
        raise 'not a valid move' unless moves.include?(end_pos)
        piece = self[start_pos]
        self[end_pos] = piece
        piece.pos = end_pos
        self[start_pos] = NullPiece.instance
    end

    def in_check?(color)
        king_pos = nil
        @rows.each do |row|
            row.each do |piece|
                king_pos = piece.pos if piece.is_a?(King) && piece.color == color
            end
        end
        @rows.each do |row|
            row.each do |piece|
                if piece.color && piece.color != color
                    return true if piece.moves.include?(king_pos)
                end
            end
        end
        false
    end

    def checkmate?(color)
        if in_check?(color)
            @rows.each do |row|
                row.each do |piece|
                    return false if piece.color == color && !piece.valid_moves.empty?
                end
            end
            return true
        end
        false
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    board.render
    p board.in_check?(:black)
    p board.in_check?(:white)
end

# require_relative "pieces"

# class Board
#     attr_reader :rows

#     def initialize(fill_board = true)
#         @sentinel = NullPiece.instance
#         make_starting_grid(fill_board)
#         @rows = Array.new(8){Array.new(8){@sentinel}} 
#     end

#     def [](pos)  #board_1 [1,1]
#         x,y = pos #x= 1, y= 1
#         @rows[x][y] 
#     end

#     def []=(pos, value = nil)
#         x,y = pos
#         @rows[x][y] ||= Piece.new(:black, @rows, pos)
#     end

#     def valid_pos(start_pos, end_pos, color)

#         if self[end_pos] == @sentinal || self[end_pos].nil?
#             return true
#         end
        
#         if self[end_pos].color == color
#             return false
#         else
#             return true
#         end

#     end

#     def move_piece(start_pos, end_pos, color) #:W, B
#         #find start_pos has a piece
#             # if true cannot move to end_point #[1,1]
#             valid_pos(start_pos, end_pos, color)
        
           


                    

        
#     #     if self[end_pos] =
#     #         raise "No available piece at position" 
#     #     else
#     #         self[end_pos] = self[start_pos]
#     #         self[start_pos] = @null_piece
#     #     end
#     end

#     # def make_starting_grid(fill_board)
#     #     if fill_board #true
#     #         (2..5).each do |i|
#     #             self.rows.each_with_index do |subarray, j|
#     #                 if j == i 
#     #                 subarray = @sentinel
#     #                 end
#     #             end
#     #         end
#     #     end
       
#         # board.each do |sub_arr|
#         #     sub_arr.map do |ele|
#         #         if ele.nil?
#         #             e
#         #         end
#         #     end
#         # end
#        board
#     end
# end

# board_1 = Board.new
# p board_1
# # board_1.valid_pos([6,6], [7,2], :black)



