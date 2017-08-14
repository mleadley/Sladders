require_relative "player"
require_relative "board"
require_relative "die"
require_relative "printer"

class Game

  def initialize(players = [])
    @players = players
    @die = Die.new()
    @printer = Printer.new()
  end

  def ai_won?
    return false if @winner.nil?
    return @winner.ai
  end

  def yield_order
  end

  def prepare
    @printer.opening_message
    player_name = @printer.ask_for_name
    generate_players(player_name)
    random_board = @printer.ask_if_random
    @board = Board.new(random_board)
  end

  def yield_commencement
    loop do
      @players.each do |player|
        next if player.alive == false
        take_turn(player)
        if player.has_won?
          @printer.winning_message(player)
          return @winner = player
        end
      end
    end
  end

  private
  def take_turn(player)
    @printer.turn_start_message(player)

    @die.roll
    @printer.die_roll_message(player, @die.result)
    validated_move(player)

    still_alive = handle_sladder(player)
    return nil if still_alive == false

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

  def generate_players(human_name)
    @players << Player.new(human_name, 0, false)
    ai_names = ["Yield", "Bestow", "Contribute", "Realise",
                "Bear", "Produce", "Afford", "Furnish"].shuffle
    2.times { @players << Player.new(ai_names.pop, 0, true) }
    @players.each {|x| puts x.inspect}
  end
end
