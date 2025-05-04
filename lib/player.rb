# Player class

class Player
  def get_guess
    print "Enter four colors to make your guess (e.g red orange yellow green): "
    gets.chomp.downcase.split
  end

  def choose_role
    puts "You can be the code maker and write the secret code for the computer to guess, or you can be the code breaker to play the game."
    puts "Enter which role you would like to play (e.g. maker):"

    input = gets.chomp.downcase
    input == "maker" ? :code_maker : :code_breaker
  end

  def set_secret_code
    input = nil

    until Code.valid_code?(input)
      puts "Choose a secret code of four colors (e.q. blue red green green):"
      input = gets.chomp.downcase.split
    end

    input
  end
end