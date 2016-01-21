class Bishop < Piece
	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x).abs
		dy = (dst_y - @pos_y).abs

		if (dx == dy)
			true
		else
			false
		end
	end
end
