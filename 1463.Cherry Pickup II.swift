class Solution {

    private var grid = [[Int]]()
    private var dp = [[[Int]]]()

    func cherryPickup(_ grid: [[Int]]) -> Int {
        let rows = grid.count, cols = grid[0].count
        self.grid = grid
        self.dp = Array(
            repeating: Array(repeating: Array(repeating: -1, count: cols), count: cols),
            count: rows
        )

        return solve(0, 0, cols - 1)
    }

    private func solve(_ row: Int, _ col1: Int, _ col2: Int) -> Int {
        if col1 < 0 || col1 >= grid[0].count || col2 < 0 || col2 >= grid[0].count {
            return 0
        }

        if dp[row][col1][col2] != -1 {
            return dp[row][col1][col2]
        }

        var res = 0;
        res += grid[row][col1]
        if col1 != col2 {
            res += grid[row][col2]
        }

        if row != grid.count - 1 {
            var _max = 0

            for newCol1 in (col1 - 1)...(col1 + 1) {
                for newCol2 in (col2 - 1)...(col2 + 1) {
                    _max = max(_max, solve(row + 1, newCol1, newCol2))
                }
            }

            res += _max;
        }

        dp[row][col1][col2] = res
        return res
    }
}
