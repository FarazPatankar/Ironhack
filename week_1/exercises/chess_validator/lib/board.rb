class Board
	attr_reader :board
	def initialize
		@board =[[],[],[],[],[],[],[],[]]
	end

	def add_piece(x, y, piece)
		@board[x][y] = piece
	end

	def move?(x, y, dst_x, dst_y)
		if (dst_x >= 0) && (dst_x <= 7) && (dst_y >= 0) && (dst_y <= 7)
			if @board[dst_x][dst_y].nil?
				if @board[x][y].move?(dst_x, dst_y)
					puts "Good move."
				else
					puts "Invalid move."
				end
			elsif @board[dst_x][dst_y].color != @board[x][y].color
				puts "You killed that piece and took it's place."
			else
				puts "There is already a piece there."
			end
		else
			puts "You cannot move out of the board."
		end
	end
end