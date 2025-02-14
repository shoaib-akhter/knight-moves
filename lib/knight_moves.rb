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


  
