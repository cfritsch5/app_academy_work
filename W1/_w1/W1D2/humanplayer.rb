class HumanPlayer
  def initialize(name = "Jesse")
    @name = name
  end

  def prompt
    puts 'enter guess: '
    guess = gets.chomp.split(",")
    guess.map! {|el| el.to_i}
  end


end
