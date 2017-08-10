require_relative "player"
require_relative "board"
require_relative "die"

class Game

  attr_reader :board

  def initialize(players)
    @players = players
    @board = Board.new()
    @die = Die.new()
  end

  def remove_player(player)
    @players.delete(player)
  end

  def yield_order()
    # for player in @players do
    #    if player.turn_order_roll == 6
    #
    # end
  end

  def take_turn(player)
    return nil if player.alive == false
    print "It's #{player.name}'s turn."
    gets
    die_roll = @die.roll()
    puts "#{player.name} rolled a #{die_roll}."
    player.move(die_roll)
    sladder = board.check_tile(player.position)
    if sladder != nil then
      if sladder.jaguar? then
        puts "Oh no! You've been eaten by a Jaguar! Bye-bye!"
        return player.kill()
      end
      puts "Oh no! You've been eaten by a Snake!" if sladder.snake?
      puts "Oh yes! You've been eaten by a Ladder!" if sladder.ladder?
      player.move(sladder.offset)
    end
    puts "#{player.name} is now at position #{player.position}."
  end

  def yield_commencement()
    loop do
      for player in @players do
        take_turn(player)
        return player.name if player.has_won?()
      end
    end
  end

end
