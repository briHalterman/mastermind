# Game Class

require_relative 'player'
require_relative 'code'

class Game
  def initialize
    @secret_code = Code.new
    @player = Player.new
    @turns_remaining = 12
  end

  def play_game
    puts "Welcome to Mastermind! Let's play!"
    until @turns_remaining == 0
      play_round
      @turns_remaining -= 1
    end
    puts "Game over! The code was: #{@secret_code.display}"
  end

  def play_round
    guess = @player.get_guess

    unless Code.valid_code?(guess)
      puts "Invalid guess. Please try again."
      return
    end

    puts "You guessed: #{guess.join(', ')}"
  end
end