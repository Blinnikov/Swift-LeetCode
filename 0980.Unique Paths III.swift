class Solution {
    private var grid = [[Int]]()

    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        self.grid = grid

        var row = 0, col = 0
        var emptyCount = 0

        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                if grid[r][c] == 0 {
                    emptyCount += 1
                } else if grid[r][c] == 1 {
                    row = r
                    col = c
                }
            }
        }

        return dfs(row, col, -1, emptyCount)
    }

    private func dfs(_ row: Int, _ col: Int, _ current: Int, _ total: Int) -> Int {
        if row < 0 || row == grid.count || col < 0 || col == grid[0].count || grid[row][col] == -1 {
            return 0
        }

        if grid[row][col] == 2 {
            return current == total ? 1 : 0
        }

        grid[row][col] = -1

        var result = dfs(row - 1, col, current + 1, total)
        result += dfs(row, col + 1, current + 1, total)
        result += dfs(row + 1, col, current + 1, total)
        result += dfs(row, col - 1, current + 1, total)

        grid[row][col] = 0;
        
        return result
    }
}
