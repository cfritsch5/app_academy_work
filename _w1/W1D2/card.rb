class Card
FACE_DOWN = "[X]" #'card'

attr_reader :facing

  def initialize(name)
    @face_up = name
    @facing = FACE_DOWN
  end

  def hide
    @facing = FACE_DOWN
  end

  def reveal
    @facing = @face_up
  end

  def to_s
    @facing
  end

  def ==(card2)
    self.facing == card2.facing
  end
end


if __FILE__ == $PROGRAM_NAME
  #run stuff
  puts 'Im in cards'
end
