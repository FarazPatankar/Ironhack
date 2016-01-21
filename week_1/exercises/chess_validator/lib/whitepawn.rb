class WhitePawn < Piece
	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x)
		dy = (dst_y - @pos_y)

		if (@pos_y == 1) && (dx == 0 && dy <= 2)
			true
		elsif (@pos_y != 1) && (dx == 0 && dy <= 1)
			true
		else
			false
		end
	end
end
