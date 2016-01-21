class Rook < Piece
	include CoordsDifference
	include StraightMover

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		straight_move?(dx, dy)
	end
end
