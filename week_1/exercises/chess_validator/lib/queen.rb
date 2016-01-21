class Queen < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

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
