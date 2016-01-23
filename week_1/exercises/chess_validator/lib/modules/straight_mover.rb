module StraightMover
  def straight_move?(dx, dy)
    (dx == 0 && dy != 0) ||
    (dy == 0 && dx != 0)
  end
end
