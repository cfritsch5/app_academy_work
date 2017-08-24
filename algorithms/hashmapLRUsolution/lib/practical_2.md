## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. a least recently used cache bumps an item to the top
of the list every time we use it so that the last item in the list is
always the last 

2.

### Part 2
```ruby
class LRUCache
  def initialize(size)
    @list = LinkedList.new
    # has head & tail
    # & append & remove methods
    #  each item will be a node with a next and prev pointer
  end

  def use
    # remove from list if exists
    # append to the start of the list
    # if length > size call remove LRU
  end

  def remove_LRU
    @list.remove(@link.last)
    # linked list remove method takes car or
    # reconnecting links from tail to the next most last
  end
end
```
