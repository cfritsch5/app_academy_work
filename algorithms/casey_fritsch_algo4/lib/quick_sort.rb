require 'byebug'
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length == 1
    pivot = array[array.length/2]
    left = array.select {|el|  }
    right = array.select {|el| el >= pivot }
    self.sort1(left) + self.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    prc = prc || Proc.new { |piv, el| piv <=> el }
    pivot = partition(array, start, length, &prc)

    left = pivot - start
    right= length - (left + 1)
    sort2!(array, start, left, &prc)
    sort2!(array, pivot + 1, right, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc = prc || Proc.new { |piv, el| piv <=> el }
    i, j = start, start + 1

    while j < start + length
      if prc.call(array[start], array[j]) > 0
        i += 1
        array[j], array[i] = array[i], array[j]
      end
      j += 1
    end
      array[start],array[i] = array[i],array[start]
    i
  end
end
