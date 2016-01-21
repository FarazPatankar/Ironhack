class Queen < Piece
	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x).abs
		dy = (dst_y - @pos_y).abs

		if (dx == dy)
			true
		elsif (dx <= 7) && (dy == 0)
			true
		elsif (dx == 0) && (dy <=7)
			true
		else
			false
		end
	end
end
