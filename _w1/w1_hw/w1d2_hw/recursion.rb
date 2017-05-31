def sum_to(n)
  sum = 0
  if n > 0
    sum = sum_to(n-1) + n
  else
    return sum
  end
end

def add_number(nums_array)
  if nums_array.length == 1
    nums_array[0]
  else
    nums_array.pop + add_number(nums_array)
  end
end

def r(n)
  n = n-1
  return nil if n == 0
  if n == 1
    1
  else
    n * r(n-1)
  end
end

def ice_cream_shop(flavors, favorite)
  return true if flavors.shift == favorite
  return false if flavors.empty?
  ice_cream_shop(flavors,favorite)
end 

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end
