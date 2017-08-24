class MaxIntSet
  def initialize(max)
    @max = max
    @arr = Array.new(max) {false}
  end

  def insert(num)
    is_valid?(num)
    @arr[num] = true
  end

  def remove(num)
    @arr[num] = false
  end

  def include?(num)
    @arr[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num < 0 || num > @max
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return if include?(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num] ? self[num].include?(num) : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if include?(num)
    @count += 1
    self[num].push(num)
    resize! if @count == num_buckets
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
