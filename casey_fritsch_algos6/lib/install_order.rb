# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph.rb'
require_relative 'topological_sort.rb'

def install_order(arr)
  packages = {}
  max = arr.flatten.max
  (1..max).each do |i|
    packages[i] = Vertex.new(i)
  end
  arr.each do |node|
    Edge.new(packages[node[1]],packages[node[0]])
  end
  topological_sort(packages.values).map {|node| node.value}
end
