def dfs(target)
  return self if self.value == target
    children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
end

def bfs(target)
  queue = [self]
  until queue.empty?
    potential_target = queue.shift
    return potential_target if potential_target.value == target
    queue += potential_target.children
  end
  nil
end
