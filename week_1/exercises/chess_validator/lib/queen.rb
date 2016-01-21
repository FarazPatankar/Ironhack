class Queen < Piece
	include CoordsDifference
	include DiagonalMover
	include StraightMover

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		diagonal_move?(dx, dy) ||
		straight_move?(dx, dy)
	end
end
