# frozen_string_literal: true

def generate_knight_moves(position)
  x, y = position
  [
    [x + 2, y + 1], [x + 2, y - 1], [x - 2, y + 1], [x - 2, y - 1],
    [x + 1, y + 2], [x + 1, y - 2], [x - 1, y + 2], [x - 1, y - 2]
  ]
end

def valid_moves(position)
  generate_knight_moves(position).select { |x, y| x.between?(0, 7) && y.between?(0, 7) }
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

def valid_move?(position, visited)
  x, y = position
  x.between?(0, 7) && y.between?(0, 7) && !visited.include?(position)
end

def explore_moves(current_position, queue, visited, parent_tracker)
  valid_moves(current_position).each do |move|
    next unless valid_move?(move, visited)

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

def reconstruct_path(parent_tracker, target)
  path = []
  current_position = target

  while current_position
    path << current_position
    current_position = parent_tracker[current_position]
  end

  path.reverse
end

def knight_moves(start, target)
  parent_tracker = bfs_search(start, target)
  path = reconstruct_path(parent_tracker, target)

  puts "You made it in #{path.length - 1} moves! Here's your path:"
  path.each { |pos| p pos }
end
