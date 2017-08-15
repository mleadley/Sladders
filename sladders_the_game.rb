require_relative "game"

game = Game.new()
game.yield_commencement
exit if game.ai_won?

sleep 2
puts
puts "..."
sleep 2
puts
puts "You "
gets
