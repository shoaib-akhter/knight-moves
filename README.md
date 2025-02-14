# Knight Moves

## Description

This project implements a **shortest path finder** for a knight on a standard 8×8 chessboard using **Breadth-First Search (BFS)**. Given a starting position and a target position, the program calculates the **minimum number of moves** required for a knight to reach the target and prints the **sequence of moves** taken.

## Features

- Uses **BFS** to guarantee the shortest path.
- Implements an **implicit graph** (no need to pre-build all board positions).
- Follows **Rubocop style guidelines** strictly (no function exceeds 10 lines).
- Uses **modular functions** for better maintainability.
- Supports **any valid knight movement** on the board.

---

## How to Run

### 1. Clone the Repository

```sh
git clone https://github.com/yourusername/knight-moves.git
cd knight-moves
```

### 2. Run the Program

Inside a Ruby environment, execute:

```ruby
require_relative "lib/knight_moves"
knight_moves([0, 0], [3, 3])
```

### 3. Example Output

```
You made it in 2 moves! Here's your path:
[0, 0]
[2, 1]
[3, 3]
```

---

## Project Breakdown

### 1. **Understanding the Problem**

- The chessboard is treated as an **implicit graph** where each position is a node.
- A knight has **8 possible moves** from any position.
- BFS is used to traverse the board **level by level**, ensuring the shortest path.

### 2. **Functions Implemented**

| Function | Description |
|----------|-------------|
| `valid_moves(position)` | Returns all valid moves from a given position. |
| `bfs_search(start, target)` | Runs BFS to find the shortest path. |
| `initialize_bfs(start)` | Initializes the queue, visited set, and parent tracker. |
| `explore_moves(current_position, queue, visited, parent_tracker)` | Processes all valid moves from a node. |
| `valid_move?(position, visited)` | Checks if a move is within the board and not visited. |
| `reconstruct_path(parent_tracker, target)` | Retraces moves from target to start. |
| `knight_moves(start, target)` | Main function to compute and print the result. |

### 3. **Rubocop Compliance**

- Every function follows the **≤10 lines rule**.
- Naming follows **Ruby best practices**.
- All functions are **modular and maintainable**.

### 4. **Testing**

- Test files were **excluded from Git** using `.gitignore`.
- Manual tests were written to verify BFS and path reconstruction.

---

## Final Thoughts

- The project is fully functional and **follows clean code principles**.
- BFS guarantees an **optimal** path in **O(1) time** on an 8×8 board.
- The **code is extendable** if needed for larger chessboards.

✅ **Project Completed & Ready for Use!** 🎉
