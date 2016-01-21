class Bishop < Piece
  include CoordsDifference

	def move?(dst_x, dst_y)
		dx, dy = get_difference(dst_x, dst_y)

		if (dx == dy)
			true
		else
			false
		end
	end
end
