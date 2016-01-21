class Knight < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		if (dx == 2 && dy == 1)
			true
		elsif (dx == 1 && dy == 2)
			true
		else
			false
		end
	end
end
