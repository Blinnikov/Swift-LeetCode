class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        let dirs: [(row: Int, col: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        var visited = grid
        var queue: [(row: Int, col: Int)] = []
        for row in 0..<rows {
            for col in 0..<cols {
                if grid[row][col] == 1 {
                    queue.append((row, col))
                }
            }
        }

        var dist = -1

        while !queue.isEmpty {
            var count = queue.count
            while count > 0 {
                var coords = queue.removeLast()
                count -= 1

                for dir in dirs {
                    let row = coords.row + dir.row
                    let col = coords.col + dir.col

                    if col >= 0 && row >= 0 && col < cols && row < rows && visited[row][col] == 0 {
                        visited[row][col] = 1
                        queue.insert((row, col), at: 0)
                    }
                }
            }

            dist += 1
        }

        return dist == 0 ? -1 : dist
    }
}
