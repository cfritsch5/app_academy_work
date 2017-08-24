require 'byebug'

class PolyTreeNode

  def initialize(value, children = [])
    @value = value
    @parent = nil
    @children = children
  end

  def parent
    @parent
  end

  def children
    @children.dup
  end

  def value
    @value
  end

  def parent=(new_parent)
    #@parent = nil if new_parent.nil?
    @parent.children = @parent.children - [self] unless @parent.nil?
    @parent = new_parent
    unless @parent.nil? || @parent.children.include?(self)
      @parent.children << self
    end
  end

  def add_child(new_child)
    new_child.parent = self
  end

  def remove_child(old_child)
    raise "not a child of #{self}" unless @children.include?(old_child)
    old_child.parent = nil
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |node|
      result = node.dfs(target)
      return result if result
    end
    nil
  end


  def bfs(target = nil, &prc)
    raise "no search condition provided" if target.nil? && block_given?
    queue = [self]
    prc ||= Proc.new { |node| node.value == target }
    until queue.empty?
      potential_target = queue.shift
      return potential_target if prc.call(potential_target)
      queue += potential_target.children
    end
    nil
  end

  protected

  def children=(new_child_array)
    @children = new_child_array
  end

end

if __FILE__ == $PROGRAM_NAME
  node_4 = PolyTreeNode.new(4);
  node_3 = PolyTreeNode.new(3, [node_4]);
  node_2 = PolyTreeNode.new(2);
  node_1 = PolyTreeNode.new(1, [node_2, node_3]);
  p node_1.bfs(2) {|node| node.children.empty? }
end
