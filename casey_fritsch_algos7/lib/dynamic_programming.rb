class DynamicProgramming

  def initialize
    @blair_cache = {1=>1,2=>2}
    @frog_down_cache = {0=>[[]], 1=>[[1]],2=>[[1,1],[2]]}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    @blair_cache[n] = blair_nums(n-1) + blair_nums(n-2) + (2 * (n - 2) + 1)
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)
  end

  def frog_cache_builder(n)
    frog_up_cache = {0=>[[]], 1=>[[1]],2=>[[1,1],[2]]}
    return frog_up_cache[n] if frog_up_cache[n]

    (3..n).map do |i|

      first = frog_up_cache[i-1].map {|ar| [1]+ar}
      second = frog_up_cache[i-2].map {|ar| [2]+ar}
      third = frog_up_cache[i-3].map {|ar| [3]+ar}
      frog_up_cache[i] = first + second + third
    end
    frog_up_cache[n]
  end

  def frog_hops_top_down(n)
    return @frog_down_cache[n] if @frog_down_cache[n]
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_down_cache[n] if @frog_down_cache[n]
    first = frog_hops_top_down_helper(n-1).map {|ar| [1]+ar}
    second = frog_hops_top_down_helper(n-2).map {|ar| [2]+ar}
    third = frog_hops_top_down_helper(n-3).map {|ar| [3]+ar}
    @frog_down_cache[n] = first + second + third
end

  def super_frog_hops(n, k)
    # super_frog_cache = {0=>[[]], 1=>[[1]],2=>[[1,1],[2]]}
    super_frog_cache = {0=>[[]], 1=>[[1]]}

    return super_frog_cache[n] if super_frog_cache[n]

    (2..n).each do |i|

      (1..k).each do |j|
        next if i < j
        super_frog_cache[i] += super_frog_cache[i-j].map {|ar| [j]+ar}
      end
    end
    super_frog_cache[n]
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
