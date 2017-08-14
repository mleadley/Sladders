require_relative "sladder"

class Board

  attr_reader :sladders

  def initialize(random_sladders = false)
    @sladders = []
    setup_fixed_board()  if random_sladders == false
    setup_random_board() if random_sladders == true
  end

  def setup_fixed_board
    ladder1 = Sladder.new( 3, 51); ladder2 = Sladder.new( 6, 27)
    ladder3 = Sladder.new(20, 70); ladder4 = Sladder.new(36, 55)
    ladder5 = Sladder.new(63, 95); ladder6 = Sladder.new(68, 98)
    snake1  = Sladder.new(99, 69); snake2  = Sladder.new(34,  1)
    snake3  = Sladder.new(65, 52); snake4  = Sladder.new(87, 57)
    snake5  = Sladder.new(91, 61); snake6  = Sladder.new(25, 25)
    snake7  = Sladder.new(47, 19); jaguar  = Sladder.new( 2, -1)
    @sladders = [
      ladder1, ladder2, ladder3, ladder4, ladder5, ladder6,
      snake1, snake2, snake3, snake4, snake5, snake6, snake7, jaguar
    ]
  end

  def setup_random_board
    possible_tiles = [*1..99].shuffle
    13.times do
      ends = possible_tiles.pop(2)
      @sladders << Sladder.new(ends[0], ends[1])
    end
    jaguar_start = possible_tiles.sample
    @sladders << Sladder.new(jaguar_start, -1)
    @sladders.each {|s| puts s.inspect}
  end

  def check_tile(tile)
    for sladder in @sladders do
      return sladder if sladder.start_pos == tile
    end
    return nil
  end

end
