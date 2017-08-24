class Octopus

def sluggish_octopus(arr)
  current_longest = arr[0]
  arr.each_with_index do |fish1,idx|
    arr[idx+1 .. -1].each do |fish2|
      if fish2.length > fish1.length && fish2.length > current_longest
        current_longest = fish2
      end
    end
  end
end

def dom_oct(arr)
  arr.merge_sort {|fish1, fish2| fish1.length <=> fish2.length}.last
end

def clever_oct(arr)
  longest = ""
  arr.each do |fish|
    if fish > longest
      longest = fish
    end
  end
  longest
end

def slow_dance(leg_direction, tile_array)
  tile_array.each_with_index do |direction,leg|
    if direction == leg_direction
      return leg
    end
  end
end

def constant_dance(leg_direction, tile_hash)
  tile_hash[leg_direction] 
end
