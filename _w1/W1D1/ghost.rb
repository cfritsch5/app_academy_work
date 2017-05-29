class Game
  attr_reader :dictionary

  def initialize(player1, player2 )
    @dictionary = Hash.new(false)
    File.readlines('dictionary.txt').each do |line|
      @dictionary[line.chomp] = true
    end

    @player1 = player1
    @player2 = player2
    @fragment = ""
  end

  # def create_dictionary
  #   File.readlines('dictionary.txt').each do |line|
  #     @dictionary[line] = true
  #   end
  # end

  def play_round
    take_turn(@current_player)
     if @fragment.win?
       "#{@current_player} won"
     else
       next_player!
       take_turn(@current_player)
     end
  end

  def win?
    dictionary[@fragment]
  end

  def current_player
    @current_player = player1
  end

  def previous_player
    @previous_player = player2
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    #add while loop until it's valid later
    guess = @current_player.guess
    valid? = valid_play?(guess)
    if valid?
      @fragment += guess
    else
      raise 'Guess again'
    end

    play_round
  end

  def valid_play?(string)
  end

end
