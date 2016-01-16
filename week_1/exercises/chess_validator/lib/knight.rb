class Knight
	attr_reader :color
	def initialize(pos_x, pos_y, color)
		@pos_x = pos_x
		@pos_y = pos_y
		@color = color
	end

	def move?(dst_x, dst_y)
		dx = (dst_x - @pos_x).abs
		dy = (dst_y - @pos_y).abs

		if (dx == 2 && dy == 1)
			true
		elsif (dx == 1 && dy == 2)
			true
		else
			false
		end
	end
end