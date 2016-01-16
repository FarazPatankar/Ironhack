class BlackPawn
	attr_reader :color
	def initialize(pos_x, pos_y, color)
		@pos_x = pos_x
		@pos_y = pos_y
		@color = color
	end

	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x)
		dy = (dst_y - @pos_y)

		if (@pos_y == 6) && (dx == 0 && (dy == -2 || dy == -1))
			true
		elsif (@pos_y != 6) && (dx == 0 && dy == -1)
			true
		else
			false
		end
	end
end