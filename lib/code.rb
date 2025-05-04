#  Code Class

# loop through guess array to see if any elements are in the correct place
# loop through remaining guess elements to see if the are included in the secret code at all

class Code
  COLORS = %w[red orange yellow green blue]
  CODE_LENGTH = 4

  def initialize
    @secret_code = Array.new(CODE_LENGTH) { COLORS.sample }
    # puts "Secret code: #{@secret_code.inspect}"
  end

  def self.valid_code?(guess)
    return false unless guess.length == CODE_LENGTH
    guess.all? { |color| COLORS.include?(color) }
  end

  def display
    %w[red blue green yellow].join(' ')
  end

  def compare_code(guess)
    exact_matches = 0
    partial_matches = 0

    if guess == @secret_code
      return :win
    end

    guess.each_with_index do |color, index|
      if color == @secret_code[index]
        exact_matches += 1
        guess[index] = nil
      end

    end

    secret_copy = @secret_code.map { |color| color }

    guess.each do |color|
      if color.nil?
        next
      end

      if secret_copy.include?(color)
        partial_matches += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end

    { exact: exact_matches, partial: partial_matches }
  end
end