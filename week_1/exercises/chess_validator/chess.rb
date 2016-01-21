require_relative("lib/piece.rb")
require_relative("lib/king.rb")
require_relative("lib/rook.rb")
require_relative("lib/bishop.rb")
require_relative("lib/knight.rb")
require_relative("lib/queen.rb")
require_relative("lib/whitepawn.rb")
require_relative("lib/blackpawn.rb")
require_relative("lib/board.rb")

#King
black_king = King.new(4, 7, "black")
white_king = King.new(4, 0, "white")

#Queen
black_queen = Queen.new(3, 7, "black")
white_queen = Queen.new(3, 0, "white")

#Bishop
black_bishop_1 = Bishop.new(2, 7, "black")
black_bishop_2 = Bishop.new(5, 7, "black")
white_bishop_1 = Bishop.new(2, 0, "white")
white_bishop_2 = Bishop.new(5, 0, "white")

#Knight
black_knight_1 = Knight.new(1, 7, "black")
black_knight_2 = Knight.new(6, 7, "black")
white_knight_1 = Knight.new(1, 0, "white")
white_knight_2 = Knight.new(6, 0, "white")

#Rook
black_rook_1 = Rook.new(0, 7, "black")
black_rook_2 = Rook.new(7, 7, "black")
white_rook_1 = Rook.new(0, 0, "white")
white_rook_2 = Rook.new(7, 0, "white")

#WhitePawn
white_pawn_1 = WhitePawn.new(0, 1, "white")
white_pawn_2 = WhitePawn.new(1, 1, "white")
white_pawn_3 = WhitePawn.new(2, 1, "white")
white_pawn_4 = WhitePawn.new(3, 1, "white")
white_pawn_5 = WhitePawn.new(4, 1, "white")
white_pawn_6 = WhitePawn.new(5, 1, "white")
white_pawn_7 = WhitePawn.new(6, 1, "white")
white_pawn_8 = WhitePawn.new(7, 1, "white")

#BlackPawn
black_pawn_1 = BlackPawn.new(0, 6, "black")
black_pawn_2 = BlackPawn.new(1, 6, "black")
black_pawn_3 = BlackPawn.new(2, 6, "black")
black_pawn_4 = BlackPawn.new(3, 6, "black")
black_pawn_5 = BlackPawn.new(4, 6, "black")
black_pawn_6 = BlackPawn.new(5, 6, "black")
black_pawn_7 = BlackPawn.new(6, 6, "black")
black_pawn_8 = BlackPawn.new(7, 6, "black")

game = Board.new
game.add_piece(0, 7, black_rook_1)
game.add_piece(7, 7, black_rook_2)
game.add_piece(0, 0, white_rook_1)
game.add_piece(7, 0, white_rook_2)
game.add_piece(1, 7, black_knight_1)
game.add_piece(6, 7, black_knight_2)
game.add_piece(1, 0, white_knight_1)
game.add_piece(6, 0, white_knight_2)
game.add_piece(2, 7, black_bishop_1)
game.add_piece(5, 7, black_bishop_2)
game.add_piece(2, 0, white_bishop_1)
game.add_piece(5, 0, white_bishop_2)
game.add_piece(3, 7, black_queen)
game.add_piece(3, 0, white_queen)
game.add_piece(4, 7, black_king)
game.add_piece(4, 0, white_king)
game.add_piece(0, 6, black_pawn_1)
game.add_piece(1, 6, black_pawn_2)
game.add_piece(2, 6, black_pawn_3)
game.add_piece(3, 6, black_pawn_4)
game.add_piece(4, 6, black_pawn_5)
game.add_piece(5, 6, black_pawn_6)
game.add_piece(6, 6, black_pawn_7)
game.add_piece(7, 6, black_pawn_8)
game.add_piece(0, 1, white_pawn_1)
game.add_piece(1, 1, white_pawn_2)
game.add_piece(2, 1, white_pawn_3)
game.add_piece(3, 1, white_pawn_4)
game.add_piece(4, 1, white_pawn_5)
# game.add_piece(5, 1, white_pawn_6)
game.add_piece(6, 1, white_pawn_7)
game.add_piece(7, 1, white_pawn_8)


game.move?(4,0 , 5,1)
game.move?(0,7 , 0,3)

# puts "\nTesting the King"

# puts "Good moves"
# p white_king.move?(5,1)
# p white_king.move?(4,1)

# puts "Bad moves"
# p white_king.move?(6,1)
# p white_king.move?(0,5)

# puts "------------------------------------"

# puts "\nTesting the Rook"

# puts "Good moves"
# p black_rook_1.move?(0,3)
# p black_rook_2.move?(4,7)

# puts "Bad moves"
# p white_rook_1.move?(3,3)
# p white_rook_2.move?(5,5)

# puts "------------------------------------"

# puts "\nTesting the Bishop"
# puts "Good moves"
# p white_bishop_1.move?(5,3)
# p white_bishop_2.move?(3,2)

# puts "Bad moves"
# p white_bishop_1.move?(5,5)
# p white_bishop_2.move?(8,8)

# puts "------------------------------------"

# puts "\nTesting the Knight"

# puts "Good moves"
# p white_knight_1.move?(3,2)
# p white_knight_2.move?(2,2)

# puts "Bad moves"
# p white_knight_1.move?(5,5)
# p white_knight_2.move?(8,8)

# puts "--------------------------------------"

# puts "\nTesting the Queen"

# puts "Good moves"
# p white_queen.move?(3,4)
# p white_queen.move?(6,3)

# puts "Bad moves"
# p white_queen.move?(8,8)
# p white_queen.move?(4,5)

# puts "-----------------------------------------"

# puts "\nTesting the White Pawn"

# puts "Good moves"
# p white_pawn_1.move?(0,3)
# p white_pawn_2.move?(1,2)

# puts "Bad moves"
# p white_pawn_1.move?(0,4)
# p white_pawn_2.move?(0,1)

# puts "--------------------------------------------"

# puts "\nTesting the Black Pawn"

# puts "Good moves"
# p black_pawn_1.move?(0,4)
# p black_pawn_2.move?(1,5)

# puts "Bad moves"
# p black_pawn_1.move?(0,7)
# p black_pawn_2.move?(1,3)
