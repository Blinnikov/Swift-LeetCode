class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let rows = grid.count // m
        let cols = grid[0].count // n

        var dp = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        dp[0][0] = grid[0][0]

        for c in 1..<cols {
            dp[0][c] = dp[0][c - 1] + grid[0][c]
        }

        for r in 1..<rows {
            dp[r][0] = grid[r][0] + dp[r - 1][0]
        }

        for r in 1..<rows {
            for c in 1..<cols {
                dp[r][c] = grid[r][c] + min(dp[r][c - 1], dp[r - 1][c])
            }
        }

        return dp[rows - 1][cols - 1]
    }
}
