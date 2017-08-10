require_relative "game"

player1 = Player.new("Michael", 0, false)
player2 = Player.new("Robb", 0, false)
player3 = Player.new("Yield", 0, true)
player4 = Player.new("Bestow", 0, true)
player5 = Player.new("Sandra", 0, false)

players = [player1, player2, player3]

game = Game.new(players)
game.yield_commencement()
