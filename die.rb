class Die

  attr_reader :result

  def initialize(sides = 6)
    @sides = sides
    @result = nil
  end

  def roll()
    @result = 1 + rand(@sides)
  end

end
