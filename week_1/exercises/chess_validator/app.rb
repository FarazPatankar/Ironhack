require_relative("lib/king.rb")
require_relative("lib/rook.rb")
require_relative("lib/bishop.rb")
require_relative("lib/knight.rb")
require_relative("lib/queen.rb")
require_relative("lib/whitepawn.rb")
require_relative("lib/blackpawn.rb")
require_relative("lib/board.rb")

# black_king = King.new(4, 7, "black")
# white_king = King.new(4, 0, "white")

# puts "\nTesting the King"

# puts "Good moves"
# p white_king.move?(5,1)
# p white_king.move?(4,1)

# puts "Bad moves"
# p white_king.move?(6,1)
# p white_king.move?(0,5)

# puts "------------------------------------"

# puts "\nTesting the Rook"
# white_rook_1 = Rook.new(0, 0, "white")
# white_rook_2 = Rook.new(7, 0, "white")
# black_rook_1 = Rook.new(0, 7, "black")
# black_rook_2 = Rook.new(7, 7, "black")

# puts "Good moves"
# p black_rook_1.move?(0,3)
# p black_rook_2.move?(4,7)

# puts "Bad moves"
# p white_rook_1.move?(3,3)
# p white_rook_2.move?(5,5)

# puts "------------------------------------"

# puts "\nTesting the Bishop"
# black_bishop_1 = Bishop.new(2, 7, "black")
# black_bishop_2 = Bishop.new(5, 7, "black")
# white_bishop_1 = Bishop.new(2, 0, "white")
# white_bishop_2 = Bishop.new(5, 0, "white")

# puts "Good moves"
# p white_bishop_1.move?(5,3)
# p white_bishop_2.move?(3,2)

# puts "Bad moves"
# p white_bishop_1.move?(5,5)
# p white_bishop_2.move?(8,8)

# puts "------------------------------------"

# puts "\nTesting the Knight"
# black_knight_1 = Knight.new(1, 7, "black")
# black_knight_2 = Knight.new(6, 7, "black")
# white_knight_1 = Knight.new(1, 0, "white")
# white_knight_2 = Knight.new(6, 0, "white")

# puts "Good moves"
# p white_knight_1.move?(3,2)
# p white_knight_2.move?(2,2)

# puts "Bad moves"
# p white_knight_1.move?(5,5)
# p white_knight_2.move?(8,8)

# puts "--------------------------------------"

# puts "\nTesting the Queen"
# white_queen = Queen.new(3, 0, "white")
# black_queen = Queen.new(3, 7, "black")

# puts "Good moves"
# p white_queen.move?(3,4)
# p white_queen.move?(6,3)

# puts "Bad moves"
# p white_queen.move?(8,8)
# p white_queen.move?(4,5)

# puts "-----------------------------------------"

# puts "\nTesting the White Pawn"
# white_pawn_1 = WhitePawn.new(0, 1, "white")
# white_pawn_2 = WhitePawn.new(1, 1, "white")

# puts "Good moves"
# p white_pawn_1.move?(0,3)
# p white_pawn_2.move?(1,2)

# puts "Bad moves"
# p white_pawn_1.move?(0,4)
# p white_pawn_2.move?(0,1)

# puts "--------------------------------------------"

# puts "\nTesting the Black Pawn"
# black_pawn_1 = BlackPawn.new(0, 6, "black")
# black_pawn_2 = BlackPawn.new(1, 6, "black")

# puts "Good moves"
# p black_pawn_1.move?(0,4)
# p black_pawn_2.move?(1,5)

# puts "Bad moves"
# p black_pawn_1.move?(0,7)
# p black_pawn_2.move?(1,3)

board = Board.new

board.push()