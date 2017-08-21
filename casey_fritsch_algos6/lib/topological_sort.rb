require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      queue.push(vertex)
    end
  end

  until queue.empty?
    current = queue.shift

    sorted.push(current)
    current.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      to_vertex.in_edges.delete(edge)
      if to_vertex.in_edges.empty?
        queue.push(to_vertex)
      end
    end
  end
  sorted
end
