class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var maze = maze
        var queue: [(row: Int, col: Int, step: Int)] = []
        queue.append((entrance[0], entrance[1], 0))
        maze[entrance[0]][entrance[1]] = "+"

        while !queue.isEmpty {
            let cur = queue.removeFirst()

            // top
            var nextRow = cur.row - 1, nextCol = cur.col
            if nextRow >= 0, maze[nextRow][nextCol] != "+" {
                if nextRow == 0 || nextCol == 0 || nextRow == maze.count - 1 || nextCol == maze[0].count - 1  {
                    return cur.step + 1
                }
                maze[nextRow][nextCol] = "+"
                queue.append((nextRow, nextCol, cur.step + 1))
            }

            // right
            nextRow = cur.row
            nextCol = cur.col + 1
            if nextCol < maze[0].count, maze[nextRow][nextCol] != "+" {
                if nextRow == 0 || nextCol == 0 || nextRow == maze.count - 1 || nextCol == maze[0].count - 1  {
                    return cur.step + 1
                }
                maze[nextRow][nextCol] = "+"
                queue.append((nextRow, nextCol, cur.step + 1))
            }

            // bottom
            nextRow = cur.row + 1
            nextCol = cur.col
            if nextRow < maze.count, maze[nextRow][nextCol] != "+" {
                if nextRow == 0 || nextCol == 0 || nextRow == maze.count - 1 || nextCol == maze[0].count - 1  {
                    return cur.step + 1
                }
                maze[nextRow][nextCol] = "+"
                queue.append((nextRow, nextCol, cur.step + 1))
            }

            // left
            nextRow = cur.row
            nextCol = cur.col - 1
            if nextCol >= 0, maze[nextRow][nextCol] != "+" {
                if nextRow == 0 || nextCol == 0 || nextRow == maze.count - 1 || nextCol == maze[0].count - 1  {
                    return cur.step + 1
                }
                maze[nextRow][nextCol] = "+"
                queue.append((nextRow, nextCol, cur.step + 1))
            }
        }

        return -1
    }
}
