class Array
def my_bsearch(target)
  half = (self.length / 2)
  return 0 if self[0] == target
  return half if self.length <= 1
  left, right = self.take(half), self.drop(half + 1)
  debugger
  if left.include?(target)
    left.my_bsearch(target)
  else
    right.my_bsearch(target)
  end

end
end 
