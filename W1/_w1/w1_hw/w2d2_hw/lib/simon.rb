class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @game_over = false
    @sequence_length = 1
    @current_sequence = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    sleep(3)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
    puts "#{@seq} #{@current_sequence}"
    if @current_sequence == @seq
      round_success_message
      @current_sequence = []
    else
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    sequence_length.times do |i|
      puts @seq[i]
      #sleep(1)
      #system("clear")
    end
  end

  def require_sequence
    (sequence_length).times do
      puts "enter color:"
      ans = gets.chomp
      @current_sequence << ans
    end
  end

  def add_random_color
    seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "good round"
  end

  def game_over_message
    "sorry game over"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  s = Simon.new
  p s.play
end
