require_relative("lib/rooms.rb")
require_relative("lib/game.rb")

dark_room = Room.new("Dark Room", "It is probably very dark in here.", nil, "S", "It is too dark, you cannot see anything.", "bottle")
forest = Room.new("Forest", "We have many dangerous animals here, please tread lightly.", "N", "W", "You found a bear, run.", "twig")
beach = Room.new("Beach", "Beware of the sharks", "E", "S", "There is no food here, just sand.", "sand")
dungeon = Room.new("Dungeon", "Surprisingly, there are no monsters here.", "N", "E", "You found an apple.", "shard")
airport = Room.new("Airport", "This is where you can leave my game. You don't really want to, do you?", "W", "end", "Lots and lots of food.", "trolley")

game = Game.new
game.add_room(dark_room)
game.add_room(forest)
game.add_room(beach)
game.add_room(dungeon)
game.add_room(airport)

game.begin_game