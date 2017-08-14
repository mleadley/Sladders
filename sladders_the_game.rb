require_relative "game"

player1 = Player.new("Michael", 0, false)
# player2 = Player.new("Robb", 0, false)
player3 = Player.new("Yield", 0, true)
player4 = Player.new("Bestow", 0, true)
# player5 = Player.new("Sandra", 0, false)

players = [player1, player3, player4]

game = Game.new(players)
game.prepare
game.yield_commencement
exit if game.ai_won?

sleep 2
puts
puts "..."
sleep 2
puts
puts "You "
gets
