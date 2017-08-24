# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node.rb'

class BinarySearchTree
  attr_reader :root
  
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      return @root = BSTNode.new(value)
    else
      insert!(value)
    end
  end

  def find(value, tree_node = @root)
    return nil if @root.nil? || tree_node.nil?

    return tree_node if value == tree_node.value
    value < tree_node.value ? find(value, tree_node.left) : find(value, tree_node.right)
  end

  def delete(value)
    node = find(value)
    return nil if node.nil?
    parent = node.parent
    left_child = node.left
    right_child = node.right


    if node.left.nil? && node.right.nil?
      if parent.nil?
        @root = nil
      elsif parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end
    end

    if node.left.nil? && node.right
      if parent.left == node
        parent.left = node.right
      else
        parent.right = node.right
      end
    elsif node.right.nil? && node.left
      if parent.left == node
        parent.left = node.left
      else
        parent.right = node.left
      end
    end
    if node.left && node.right
      if parent.left == node
        max = maximum(node.left)
        parent.left = max
      else
        parent.right = max
      end
      max.parent = parent
      max.right = node.right
      max.right.parent = max
      unless max == node.left
        max.left = node.left
        node.left.parent = max
      end
    end
    return nil if node.nil?
    node = nil
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right.nil?
      tree_node = tree_node.right
    end
    return tree_node
  end
  def self.maximum(tree_node = @root)
    until tree_node.right.nil?
      tree_node = tree_node.right
    end
    return tree_node
  end

  def depth(tree_node = @root)
    return 0 if @root.nil?
    return 0 if @root.left.nil? && @root.right.nil?

    count_left = 0
    count_right = 0

    if !tree_node.left.nil?
      count_left += 1
      count_left += depth(tree_node.left)
    end

    if !tree_node.right.nil?
      count_right += 1
      count_right += depth(tree_node.right)
    end

    return count_left > count_right ? count_left : count_right
  end

  def is_balanced?(tree_node = @root)
    return true if depth(tree_node) == 0

    left_depth = depth(tree_node.left)
    right_depth= depth(tree_node.right)

    if left_depth == right_depth
      return true
    else
      return false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if @root.nil?
    traverse(tree_node, arr)
    arr
  end


  private
  # optional helper methods go here:


  def traverse(tree_node = nil, arr)
    return [] if tree_node.nil?
    unless tree_node.left.nil?
      arr.push(tree_node.left.value)
      traverse(tree_node.left, arr)
    end

    unless tree_node.right.nil?
      arr.push(tree_node.right.value)
      traverse(tree_node.right, arr)
    end
  end

  def insert!(value, tree_node = @root)
    # puts value, tree_node.parent

    if value > tree_node.value
      if tree_node.right.nil?
        new_node = BSTNode.new(value)
        new_node.parent = tree_node
        tree_node.right = new_node
      else
        insert!(value, tree_node.right)
      end
    elsif tree_node.left.nil?
      new_node = BSTNode.new(value)
      new_node.parent = tree_node
      tree_node.left = new_node
    else
      insert!(value, tree_node.left)
    end
    tree_node
  end

end
