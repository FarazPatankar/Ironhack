class Knight < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		(dx == 2 && dy == 1) || (dx == 1 && dy == 2)
	end
end
