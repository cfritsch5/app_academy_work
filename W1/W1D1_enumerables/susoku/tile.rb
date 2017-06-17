require 'colorize'

class Tile

  def initialize(value = nil , given = false)
    @given = given
    @value = value
  end

  def to_s
    if @given
      @value.nil? ? "   " : @value.to_s.colorize(:blue)
    else
      @value.to_s.colorize(:light_black)
    end
  end
end
