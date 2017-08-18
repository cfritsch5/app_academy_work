class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value = nil)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end
end
