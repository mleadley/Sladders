require_relative "player"
require_relative "board"
require_relative "die"
require_relative "printer"

class Game

  def initialize(players)
    @players = players
    @board = Board.new()
    @die = Die.new()
    @printer = Printer.new()
  end

  def yield_order()
  end

  def yield_commencement()
    @printer.opening_message
    loop do
      @players.each do |player|
        next if player.alive == false
        take_turn(player)
        return @printer.winning_message(player) if player.has_won?
      end
    end
  end

  private
  def take_turn(player)
    @printer.turn_start_message(player)

    @die.roll
    @printer.die_roll_message(player, @die.result)
    validated_move(player)

    handle_sladder(player)

    @printer.turn_end_message(player)
  end

  def handle_sladder(player)
    sladder = @board.check_tile(player.position)
    if sladder != nil
      @printer.sladder_message(sladder)
      player.move(sladder.offset)
      return player.kill() if sladder.jaguar?
    end
  end

  def validated_move(player)
    adjusted_move = @die.result
    distance_to_finish = 100 - player.position
    if distance_to_finish < @die.result
      overshoot = @die.result - distance_to_finish
      adjusted_move -= (2 * overshoot)
    end
    player.move(adjusted_move)
  end

end
