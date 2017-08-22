# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @length = length
    @store = Array.new(length);
  end

  # O(1)
  def [](index)
    out_of_bound?(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    out_of_bound?(index)
    @store[index] = value
  end

  protected
  attr_accessor :store

  def out_of_bound?(index)
    raise "index out of bounds" if index > @length
  end
end
