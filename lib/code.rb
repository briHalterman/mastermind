#  Code Class

# loop through guess array to see if any elements are in the correct place
# loop through remaining guess elements to see if the are included in the secret code at all

class Code
  COLORS = %w[red orange yellow green blue]
  CODE_LENGTH = 4
  def self.valid_code?(guess)
    return false unless guess.length == CODE_LENGTH
    guess.all? { |color| COLORS.include?(color) }
  end

  def display
    %w[red blue green yellow].join(' ')
  end
end