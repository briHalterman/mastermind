class Player
  def get_guess
    print "Enter four colors to make your guess (e.g red orange yellow green): "
    gets.chomp.downcase.split
  end
end