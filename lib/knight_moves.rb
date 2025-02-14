def valid_moves(position)
    x, y = position
    moves = [
        [x + 2, y + 1], [ x + 2, y -1],
        [x - 2, y + 1], [x - 2, y - 1],
        [x + 1, y + 2], [x + 1, y - 2],
        [x - 1, y + 2], [x - 1, y - 2]
    ]

    # Keep only moves within the board boundaries
    moves.select { |new_x, new_y| new_x.between?(0, 7) && new_y.between?(0, 7)}
end

def initialize_bfs(start)
    queue = [start]
    parent_tracker = { start => nil }
    visited = Set.new([start])
    [queue, parent_tracker, visited]
end

def target_reached?(current_position, target)
    current_position == target
end

def is_valid_move?(position, visited)
    x, y = position
    x.between?(0, 7) && y.between?(0, 7) && !visited.include?(position)
end
  
def explore_moves(current_position, queue, visited, parent_tracker)
    valid_moves(current_position).each do |move|
      next unless is_valid_move?(move, visited)
  
      visited.add(move)
      parent_tracker[move] = current_position
      queue.push(move)
    end
end

def bfs_search(start, target)
    return { target => nil } if start == target
  
    queue, parent_tracker, visited = initialize_bfs(start)
  
    until queue.empty?
      current_position = queue.shift
      return parent_tracker if target_reached?(current_position, target)
  
      explore_moves(current_position, queue, visited, parent_tracker)
    end
  
    {}
end
  
  
