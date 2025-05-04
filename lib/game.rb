# Game Class

require_relative 'player'
require_relative 'code'

class Game
  def initialize
    @secret_code = Code.new
    @player = Player.new
    @turns_remaining = 12
    @payer_role = @player.choose_role
  end

  def play_game
    puts "Welcome to Mastermind! Let's play!"
    if @player_role == :code_breaker
      play_as_code_breaker
    else
      play_as_code_maker
    end
  end

  def play_as_code_breaker
    until @turns_remaining == 0
      play_round_as_code_breaker
      @turns_remaining -= 1
    end
    puts "Game over! The code was: #{@secret_code.display}"
  end

  def play_round_as_code_breaker
    guess = @player.get_guess

    puts "You guessed: #{guess.join(', ')}"

    unless Code.valid_code?(guess)
      puts "Invalid guess. Please try again."
      return
    end

    result = @secret_code.compare_code(guess)

    if result == :win
      puts "Congratulations! You Win!"
      exit
    else
      puts "You have #{result[:exact]} exact match(es)."
      puts "You have #{result[:partial]} partial match(es)."
      puts "You have #{@turns_remaining - 1} turns remaining."
    end
  end

  def play_as_code_maker
    @secret_code = @player.set_secret_code
    until @turns_remaining == 0
      play_round_as_code_maker
      @turns_remaining -= 1
    end
  end

  def play_round_as_code_maker
    
  end
end