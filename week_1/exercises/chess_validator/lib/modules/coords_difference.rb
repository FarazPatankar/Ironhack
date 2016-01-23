module CoordsDifference
  def get_difference(dst_x, dst_y, options = {})
    dx = dst_x - @pos_x
    dy = dst_y - @pos_y

    unless options[:signed]
      dx = dx.abs
      dy = dy.abs
    end

    return dx, dy
  end
end
