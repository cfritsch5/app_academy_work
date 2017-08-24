class Stack

  def initialize
    @ivar = []
  end

  def add(el)
    @ivar << el
  end

  def remove
    @ivar.pop
  end

  def show
    @ivar
  end
end

class Queue

  def initialize
    @que = []
  end

  def enqueue(el)
    @que << el
  end

  def dequeue
    @que.shift
  end

  def show
    @que
  end

end

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    @map << [key,value] #if exists?(key)
  end

  def lookup(key)
    return 'key does not exist' unless exists?(key)
    index = @map.flatten.index(key) / 2
    @map[index]
  end

  def exists?(key)
    @map.flatten.index(key).nil? ? false : true
  end

  def remove(key)
    return 'key does not exits' unless exists?(key)
    index = @map.flatten.index(key) / 2
    @map.delete_at(index)
  end

  def show
    @map
  end

end
