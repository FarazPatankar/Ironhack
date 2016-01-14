require_relative("lib/rooms.rb")
require_relative("lib/game.rb")

dark_room = DarkRoom.new
forest = Forest.new
beach = Beach.new
dungeon = Dungeon.new
airport = Airport.new

game = Game.new
game.add_room(dark_room)
game.add_room(forest)
game.add_room(beach)
game.add_room(dungeon)
game.add_room(airport)

game.begin_game