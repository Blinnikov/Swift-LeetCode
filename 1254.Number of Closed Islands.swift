class Solution {
    func closedIsland(_ grid: [[Int]]) -> Int {
        var grid = grid
        var res = 0

        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == 0 {
                    res += dfs(row, col, &grid)
                }
            }
        }

        return res
    }

    private func dfs(_ row: Int, _ col: Int, _ grid: inout [[Int]]) -> Int {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count {
            return 0
        }

        if grid[row][col] > 0 {
            return 1
        }

        grid[row][col] = 2

        return dfs(row + 1, col, &grid) * dfs(row - 1, col, &grid) * dfs(row, col + 1, &grid) * dfs(row, col - 1, &grid)
    }
}
