class Solution {
    private let dirs = [-1, 0, 1]

    private var grid = [[Int]]()
    private var dp = [[Int]]()

    func maxMoves(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.dp = Array(repeating: Array(repeating: -1, count: grid[0].count), count: grid.count)

        var res = 0

        for i in 0..<grid.count {
            res = max(res, dfs(i, 0))
        }

        return res
    }

    private func dfs(_ row: Int, _ col: Int) -> Int {
        if dp[row][col] != -1 {
            return dp[row][col]
        }

        var res = 0

        for dir in dirs {
            let nextRow = row + dir
            let nextCol = col + 1

            if nextRow < 0 || nextRow >= grid.count {
                continue
            }

            if nextCol < 0 || nextCol >= grid[0].count {
                continue
            }

            if grid[nextRow][nextCol] <= grid[row][col] {
                continue
            }

            res = max(res, dfs(nextRow, nextCol) + 1)
        }

        dp[row][col] = res

        return res
    }
}
