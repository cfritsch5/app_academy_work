class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arr = flatten.map.with_index do |num, i|
      (num + i).hash
    end
    arr.reduce(:+).hash
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    sorted_arr = self.sort_by { |k, _| k }
    sorted_arr.each do |sub_arr|
      sub_arr.each do |el|

        if el.is_a? Fixnum
          sum += el.hash
        elsif el.is_a? String
          sum += el.hash
        elsif el.is_a? Symbol
          sum += el.to_s.hash
        end

      end
    end
    sum.hash
  end
end
