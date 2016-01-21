class WhitePawn < Piece
	include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y, signed: true)

		if (@pos_y == 1) && (dx == 0 && dy <= 2)
			true
		elsif (@pos_y != 1) && (dx == 0 && dy <= 1)
			true
		else
			false
		end
	end
end
