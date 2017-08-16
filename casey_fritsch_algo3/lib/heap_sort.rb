require_relative "heap"

class Array
  def heap_sort!
    sorted = BinaryMinHeap.new
    self.each do |el|
      sorted.push(el)
    end
  end
end
