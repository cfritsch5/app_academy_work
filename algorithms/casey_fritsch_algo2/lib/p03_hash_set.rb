require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    self[key] << key
    @count += 1
    resize! if count == num_buckets
  end

  def include?(key)
    self[key].any? { |el| el == key }
  end

  def remove(key)
    return unless include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]

  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    temp_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |num|
        temp_store[num % new_num_buckets] << num
      end
    end

    @store = temp_store
  end
end
