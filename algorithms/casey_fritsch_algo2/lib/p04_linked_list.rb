class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
    self
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new(:head, nil)
    @tail = Node.new(:tail, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    each { |link| return link.val if right_link?(link, key) }
  end

  def right_link?(link, key)
    link.key == key
  end

  def include?(key)
    each { |link| return true if right_link?(link, key) }
    false
  end

  def append(key, val)
    new_link = Node.new(key, val)
    prev_link = @tail.prev
    @tail.prev = new_link
    prev_link.next = new_link
    new_link.next = @tail
    new_link.prev = prev_link
  end

  def update(key, val)
    each { |link| link.val = val if right_link?(link, key) }
  end

  def remove(key)
    each do |link|
      if link.key == key
        link.remove
        return link.val
      end
    end
  end

  def each(&prc)
    link = @head
    until link == last
      link = link.next
      prc.call(link)
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
