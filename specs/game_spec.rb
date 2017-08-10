require("minitest/autorun")
require("minitest/rg")
require_relative("../game")
require_relative("../board")
require_relative("../player")

class GameTest < MiniTest::Test

  def setup

    @player1 = Player.new("Michael", 0, false)
    @player2 = Player.new("Robb", 0, false)
    @player3 = Player.new("Yield", 0, true)
    @player4 = Player.new("Bestow", 0, true)
    @players = [@player1, @player2, @player3, @player4]

    @game = Game.new(@players)

  end

  def test_board_exists
    assert_equal( false, @game.board.is_nil?() )
  end

  def test_yield_order
    turn_order = @game.yield_order()

  end

end
