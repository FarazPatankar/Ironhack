class WhitePawn < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y, signed: true)

		(@pos_y == 1) && (dx == 0 && dy <= 2) ||
		(@pos_y != 1) && (dx == 0 && dy <= 1)
	end
end
