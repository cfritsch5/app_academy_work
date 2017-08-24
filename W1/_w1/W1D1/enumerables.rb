class Array
  def my_each(&prc)
    self.length.times do |index|
      prc.call(self[index])
    end
    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |el|
      selected << el if prc.call(el)
    end
    selected
  end

  def my_reject(&blck)
    kept_elements = []

    self.my_each do |el|
      if blck.call(el) == false
        kept_elements << el
      end
    end

    kept_elements
  end

  def my_any?(&blck)
    self.my_each do |el|
      if blck.call(el)
        return true
      end
    end

    false
  end

  def my_flatten

    flattened = []

    self.my_each do |el|
      if el.is_a? Array
        # flattened.concat(el.my_flatten)
       flattened += el.my_flatten
      else
        flattened << el
      end
    end

    flattened
  end

  def my_zip(*arrays)
    i = 0
    sub_array = []

    self.my_each do |el|
      sub_sub_array = [el]

      arrays.my_each do |el|
        sub_sub_array << el[i]
      end
      i += 1

      sub_array << sub_sub_array
    end
    sub_array
  end

  def my_rotate(shift=1)
    rotated = []

    self.each_index do |idx|
        rotated[idx] = self[(idx + shift) % self.length]
    end

    rotated
  end

  def my_join(separator="")
    joined = ""

    (0...self.length - 1).each do |idx|
      joined += self[idx] + separator
    end

    joined += self.last

  end

  def my_reverse
    reversed = []
    # i = self.length-1
    # while i >= 0
    (self.length-1).downto(0) do |i|
      reversed << self[i]
      # i -= 1
    end

    reversed
  end

end

[ 1, 2, 3, [4, 5]]
