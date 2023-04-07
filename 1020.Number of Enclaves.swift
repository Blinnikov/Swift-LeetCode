class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var grid = grid

        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if (col == 0 || row == 0 || row == grid.count - 1 || col == grid[0].count - 1) && grid[row][col] == 1 {
                    dfs(row, col, &grid)
                }
            }
        }

        print(grid)

        return grid.reduce(0, { (sum, row) in sum + row.reduce(0, +) })
    }

    private func dfs(_ row: Int, _ col: Int, _ grid: inout [[Int]]) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] == 0 {
            return
        }

        print(grid[row][col])
        grid[row][col] = 0

        dfs(row + 1, col, &grid)
        dfs(row - 1, col, &grid)
        dfs(row, col + 1, &grid)
        dfs(row, col - 1, &grid)
    }
}
