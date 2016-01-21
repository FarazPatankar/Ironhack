class Queen < Piece
	include CoordsDifference
	include DiagonalMover
	include StraightMover

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		if diagonal_move?(dx, dy) ||
			 straight_move?(dx, dy)
			true
		else
			false
		end
	end
end
