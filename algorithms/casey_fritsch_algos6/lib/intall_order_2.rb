require_relative 'topological_sort.rb'

def install_order2(arr)
  packages = {}
  arr.each do |vertex|
    packages[vertex[0]] = Vertex.new(vertex[0]) unless vertex.nil? && packages[vertex[0]]
    packages[vertex[1]] = Vertex.new(vertex[1]) unless vertex.nil? && packages[vertex[1]]
    if packages[vertex[0]] && packages[vertex[1]]
      Edge.new(packages[vertex[0]], packages[vertex[1]] )
    end
  end
  topological_sort(packages.values).map {|node| node.value}
end
