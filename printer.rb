class Printer

  def opening_message
    puts "Welcome to Sladders The Game!"
  end

  def turn_start_message(player)
    puts
    print "It's #{player.name}'s turn."
    player.ai == false ? gets : puts
  end

  def die_roll_message(player, die_roll)
    puts "#{player.name} rolled a #{die_roll}."
  end

  def sladder_message(sladder)
    puts "Oh no! You've been eaten by a Jaguar! Bye-bye!" if sladder.jaguar?
    puts "Oh no! You've been eaten by a Snake!" if sladder.snake?
    puts "Oh yes! You've been eaten by a Ladder!" if sladder.ladder?
  end

  def turn_end_message(player)
    puts "#{player.name} is now at position #{player.position}."
  end

  def winning_message(winner)
    puts "Congratulations on avoiding the Jaguar, #{winner.name}!"
  end

end