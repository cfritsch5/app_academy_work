def range(start_point, end_point)
  return [] if end_point <= start_point
  range(start_point, (end_point - 1)) << end_point
end

def sum_arr_rec(arr)
  return arr.first if arr.length == 1
  arr[0] + sum_arr_rec(arr[1..-1])
end

def sum_arr_itr(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end
  sum
end

$counter = 0

def exp1(b, n)
  puts $counter += 1
  return 1 if n == 0
  b * exp1(b, n - 1)
end

def exp2(b, n)
  puts $counter += 1
  return 1 if n == 0
  if n.even?
    recurring_val = exp2(b, n/2)
    recurring_val * recurring_val
  else
    recurring_val = exp2(b, (n - 1) / 2)
    b * recurring_val * recurring_val
  end
end

def deep_dup(arr)
  new_arr = []
  arr.each do |el|
    if el.is_a? Array
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end
  new_arr
end

def fib(n)
  return [1,1].take(n) if n <= 2
  previous_arr = fib(n-1)
  current_num = previous_arr[-2..-1].reduce(:+)
  previous_arr << current_num
end

def subset(arr)
  return [[]] if arr.empty?
  sub_arr = subset(arr[0...-1])
  sub_arr + sub_arr.map { |array| array + [arr.last] }
end

def permutations(array)
  return array if array.length <= 1
  array.map.with_index do |el, idx|
    puts "el: #{el}"
    if idx == array.length - 1
      sub_arr = array[0...idx]
    else
      sub_arr = array[0...idx] + array[(idx + 1)..-1]
    end
    puts  "sub_arr: #{sub_arr}"
    [el] + permutations(sub_arr)
  end
end

def binary_search(arr, target)
  return nil if arr.empty?
  halfway = arr.length / 2
  if arr[halfway] == target
    halfway
  elsif arr[halfway] > target
    binary_search(arr[0...halfway], target)
  else
    binary_search(arr[halfway + 1..-1], target) + halfway + 1
  end
end

def merge_sort(array)
  return array if array.length <= 1
  halfway = (array.length - 1) / 2
  first_half = array[0..halfway]
  second_half = array[halfway + 1..-1]
  merge(merge_sort(first_half),merge_sort(second_half))
end

def merge(arr1, arr2)
  sorted_array = []
  until arr1.empty? || arr2.empty?
    if arr1.first < arr2.first
      sorted_array << arr1.shift
    else
      sorted_array << arr2.shift
    end
  end
  sorted_array + arr1 + arr2
end

# def greed_make_change(change, coin_arr)
#   return [] if change <= coin_arr.min - 1
#   change_arr = []
#   coin_arr.each do |coin|
#     if change - coin >= 0
#       change_arr << coin
#       change_arr += greed_make_change((change - coin), coin_arr)
#       change -= coin
#       break
#     end
#   end
#   change_arr
# end

def greed_make_change(change, coin_arr)
  return [] if change <= coin_arr.min - 1
  changed = false
  i = 0
  change_arr = []
  until changed || i == coin_arr.length
    remainder = change - coin_arr[i]
    if remainder >= 0
      change_arr += [coin_arr[i]] + greed_make_change(remainder,coin_arr)
      change -= coin_arr[i]
      changed = true
    end
    i += 1
  end
  change_arr
end

def make_better_change(change, coin_arr)
  return [] if change <= coin_arr.min - 1
  change_arr = []
  
end
