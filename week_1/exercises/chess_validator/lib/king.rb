class King < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		(dx == 0 || dx == 1) && (dy == 0 || dy == 1)
	end
end
