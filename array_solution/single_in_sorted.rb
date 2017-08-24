def single_in_sorted(arr)
# binary search but check if lenght of each side is odd
# or even the odd side contains the
mid = (arr.length) / 2
left = arr[0 .. mid]
right = arr[ mid + 1 .. -1]
if arr.last == arr[-2]
  
end

# [1,1,2,2,4,5,5,6,6,7,7,9,9]
# length = 13
# length - 1 / 2 = 6
# length will always be odd
# and we split on even numbers
# if the last two are the  same the odd number is to the right
#  if last and last -1 ==
