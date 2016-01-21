class Rook < Piece
	include CoordsDifference
	include StraightMover

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		if straight_move?(dx, dy)
			true
		else
			false
		end
	end
end
