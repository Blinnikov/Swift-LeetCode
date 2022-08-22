class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var seen = Array(repeating: Array(repeating: false, count: cols), count: rows)
        
        var row = 0, col = 0
        
        outer: for r in 0..<rows {
            for c in 0..<cols {
                // print("Checking")
                if grid[r][c] == 1 {
                    row = r
                    col = c
                    break outer
                }
            }
        }
        
        var sides = 0
        var queue = [(Int,Int)]()
        queue.append((row, col))
        
        while !queue.isEmpty {
            (row, col) = queue.removeLast()
            // print(row, col)
            
            if seen[row][col] {
                continue
            }
            
            seen[row][col] = true
            
            // top
            if row > 0 && grid[row-1][col] == 1 {
                if !seen[row-1][col] {
                    queue.append((row-1, col))
                }
            } else {
                sides += 1
            }
            
            // right
            if col < cols-1 && grid[row][col+1] == 1 {
                if !seen[row][col+1] {
                    queue.append((row, col+1))
                }
            } else {
                sides += 1
            }
            
            // bottom
            if row < rows-1 && grid[row+1][col] == 1 {
                if !seen[row+1][col] {
                    queue.append((row+1, col))
                }
            } else {
                sides += 1
            }
            
            // left
            if col > 0 && grid[row][col-1] == 1 {
                if !seen[row][col-1] {
                    queue.append((row, col-1))
                }
            } else {
                sides += 1
            }
        }
        
        return sides
    }
}
