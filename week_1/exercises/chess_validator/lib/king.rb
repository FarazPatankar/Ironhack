class King < Piece
	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x).abs
		dy = (dst_y - @pos_y).abs

		if (dx == 0 || dx == 1) && (dy == 0 || dy == 1)
			true
		else
			false
		end
	end
end
