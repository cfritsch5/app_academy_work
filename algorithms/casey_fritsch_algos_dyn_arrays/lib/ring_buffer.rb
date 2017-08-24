require_relative "static_array"
require 'byebug'
class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @start_idx = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    index = check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, val)
    index = check_index(index)
    @store[index] = val
  end

  # O(1)
  def pop
    index = check_index(@length - 1)
    @length -= 1
    popped = @store[index]
    @store[index] = nil
    popped
  end

  # O(1) ammortized
  def push(val)
    debugger
    @length += 1
    index = check_index(@length - 1)
    @store[index] = val
  end

  # O(1)
  def shift
    check_index(@length - 1)
    @store[@start_idx] = nil
    @start_idx += 1
    @length -= 1
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    @length += 1
    @
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    index = convert_index(index)
    raise "index out of bounds" if (index < 0 || index >= @length)
    index
  end

  def resize!
    old_store = @store.dup
    @capacity = @capacity * 2
    @store = StaticArray.new(@capacity)
    @length.times do |i|
      @store[i] = old_store[i]
    end
  end

  def convert_index(index)
    (index + @start_idx) % @capacity
  end
end

r = RingBuffer.new
puts "I'm working"
