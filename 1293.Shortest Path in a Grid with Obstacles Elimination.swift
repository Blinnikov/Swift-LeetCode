class Solution {
    
    private let directions = [
        (row: 1, col: 0),
        (row: -1, col: 0),
        (row: 0, col: -1),
        (row: 0, col: 1)
    ]
    
    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        
        var visited = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)
        visited[0][0] = 0
        
        var queue = [(row: Int, col: Int, obst: Int)]()
        queue.append((0, 0, 0))
        
        var steps = 0
        
        while !queue.isEmpty {
            var count = queue.count
            while count > 0 {
                count -= 1
                
                let step = queue.removeLast()
                if step.row == rows - 1 && step.col == cols - 1 {
                    return steps
                }
                
                for dir in directions {
                    let nextRow = step.row + dir.row
                    let nextCol = step.col + dir.col
                    
                    if nextRow < 0 || nextRow >= rows || nextCol < 0 || nextCol >= cols {
                        continue
                    }
                    
                    let nextObst = step.obst + grid[nextRow][nextCol]
                    if nextObst > k {
                        continue
                    }
                    
                    if visited[nextRow][nextCol] <= nextObst {
                        continue
                    }
                    visited[nextRow][nextCol] = nextObst
                    queue.insert((nextRow, nextCol, nextObst), at: 0)
                }
            }
            steps += 1
        }
        
        return -1
    }
}
