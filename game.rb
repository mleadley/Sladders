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

  def yield_order()
    # for player in @players do
    # end
  end

  def validated_move(player, die_roll)
    adjusted_move = die_roll
    distance_to_finish = 100 - player.position
    if distance_to_finish < die_roll
      overshoot = die_roll - distance_to_finish
      adjusted_move -= (2 * overshoot)
    end
    player.move(adjusted_move)
  end

  def take_turn(player)
    print "It's #{player.name}'s turn."
    gets

    die_roll = @die.roll()
    puts "#{player.name} rolled a #{die_roll}."
    validated_move(player, die_roll)

    sladder = board.check_tile(player.position)
    if sladder != nil
      sladder_print(sladder)
      player.move(sladder.offset)
      return player.kill() if sladder.jaguar?
    end

    puts "#{player.name} is now at position #{player.position}."
  end

  def yield_commencement()
    loop do
      @players.each do |player|
        next if player.alive == false
        take_turn(player)
        return player.name if player.has_won?()
      end
    end
  end

  private
  def sladder_print(sladder)
    puts "Oh no! You've been eaten by a Jaguar! Bye-bye!" if sladder.jaguar?
    puts "Oh no! You've been eaten by a Snake!" if sladder.snake?
    puts "Oh yes! You've been eaten by a Ladder!" if sladder.ladder?
  end

end
