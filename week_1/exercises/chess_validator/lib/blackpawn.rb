class BlackPawn < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y, signed: true)

		(@pos_y == 6) && (dx == 0 && (dy == -2 || dy == -1)) ||
		(@pos_y != 6) && (dx == 0 && dy == -1)
	end
end
