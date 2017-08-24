def factors(num)
  factors = []
  num.downto(1) do |num2|
    if num % num2 == 0
      factors << num2
    end
  end

  factors.sort
end

class Array
  def bubble_sort!
    (0 ... self.length).each do |idx2|
      (0 ... self.length-1).each do |idx|
        if self[idx] > self[idx + 1]
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    copy = self[0..-1]
  end

end


if __FILE__ == $PROGRAM_NAME
end
