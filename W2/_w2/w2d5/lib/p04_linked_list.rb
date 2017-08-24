class Link
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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(:head, nil)
    @tail = Link.new(:tail, nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
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

  def include?(key)
    each { |link| return true if right_link?(link, key) }
    false
  end

  def append(key, val)
    new_link = Link.new(key, val)
    prev_link = @tail.prev
    @tail.prev = new_link
    prev_link.next = new_link
    new_link.next = @tail
    new_link.prev = prev_link
  end

  def update(key, val)
    each { |link| link.val = val if right_link?(link, key) }
  end

  def right_link?(link, key)
    link.key == key
  end

  def remove(key)
    each do |link|
      if link.key == key
        prev_l = link.prev
        next_l = link.next
        prev_l.next = next_l
        next_l.prev = prev_l
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
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
