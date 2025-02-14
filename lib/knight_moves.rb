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

