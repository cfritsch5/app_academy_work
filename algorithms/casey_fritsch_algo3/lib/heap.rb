class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc || Proc.new {|parent, child| parent > child}
    @store = []
  end

  def count
    @store.length
  end

  def extract
    min = @store[0]
    # p @store[0]
    pop = @store.pop
    @store[0] = pop
    # p @store
    @store = BinaryMinHeap.heapify_down(@store,0)
    # p @store
    min
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    @store = BinaryMinHeap.heapify_up(@store,( @store.length - 1))
  end

  public
  def self.child_indices(len, parent_index)
    idx = (2 * parent_index)
    child1, child2, indices = idx + 1, idx + 2, []

    indices.push(child1) unless child1 >= len
    indices.push(child2) unless child2 >= len
    indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    return array if array.length <= 1
    # prc = prc || Proc.new {|parent, child| parent > child}
    prc = prc || Proc.new {|parent, child| parent <=> child}

    valid = false
    until valid
      parent = array[parent_idx]
      child1_idx, child2_idx = child_indices(len, parent_idx)

      child1 = child1_idx ? array[child1_idx] : -1
      child2 = child2_idx ? array[child2_idx] : -1

      if child1 < child2
        smaller_child = child1
        smaller_child_idx = child1_idx
      else
        smaller_child = child2
        smaller_child_idx = child2_idx
      end
      # puts "child idx:#{[child1_idx, child2_idx]} val:#{[child1, child2]}, parent idx:#{parent_idx} val:#{parent}"
      if smaller_child_idx && prc.call(parent, child1) > 0
        array[smaller_child_idx] = parent
        array[parent_idx] = child1
        parent_idx = child1_idx
      else
        valid = true
      end
      p array
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if array.length <= 1
    prc = prc || Proc.new {|parent, child| parent <=> child}

    parent_idx = parent_index(child_idx)
    child = array[child_idx]
    parent = array[parent_idx]

    while (child_idx != 0) && (prc.call(parent, child) > 0)
      p prc.call(parent, child)
      child = array[child_idx]
      parent_idx = parent_index(child_idx)
      parent = array[parent_idx]

      p array[child_idx] = parent
      p array[parent_idx] = child

      child_idx = parent_idx
      p array
    end
    array
  end
end
# copy pasta for pry
# load 'lib/heap.rb'
# b = BinaryMinHeap.new
