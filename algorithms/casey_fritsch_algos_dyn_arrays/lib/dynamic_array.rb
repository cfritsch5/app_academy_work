require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    initial_size = 8
    @store = StaticArray.new(initial_size)
    @capacity = initial_size
    @length = 0
  end

  # O(1)
  def [](index)
    index = @length - index if index < 0
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    check_index(@length - 1)
    @length -= 1
    popped = @store[@length]
    @store[@length] = nil
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @store[@length] = val
    @length += 1
    if @length > @capacity
      resize!
    end
    @store
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(@length - 1)
    shifted = @store[0]
    (@length + 1).times do |i|
      @store[i] = @store[i+1]
    end
    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    (@length).downto(0) do |i|
      @store[i] = @store[i-1]
    end
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index >= @length
    raise "index out of bounds" if index < 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old_store = @store
    @capacity = @capacity * 2
    @store = StaticArray.new(@capacity)
    @length.times do |i|
      @store[i] = old_store[i]
    end
  end
end
