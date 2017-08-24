# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.

class LinkedList
  # ....

  def reverse
    next_link = self.first

    while next_link
      link = next_link
      next_link = link.next

      link.next = link.prev
      link.prev = next_link
    end
end

# head.next => A
# head.prev => nil
#
# A.next => B
# A.prev => head
#
# B.next => C
# B.prev => A
#
# C.next => tail
# C.prev => B
#
# tail.next => nil
# tail.prev => C

# next_link = head
# while (head) //=> true
#   link = head
#   next_link = A
#   link.next = nil
#   link.prev = A
# end

# head.next = nil
# head.prev = A
