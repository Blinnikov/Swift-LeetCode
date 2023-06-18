class Solution {
    private let mod = 1000000007
    private let noValue = -1
    
    private var grid = [[Int]]()
    private var dp = [[Int]]()

    func countPaths(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.dp = Array(repeating: Array(repeating: noValue, count: grid[0].count), count: grid.count)

        var res = 0

        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                res = (res + traverse(row, col, noValue)) % mod
            }
        }

        return res
    }

    private func traverse(_ row: Int, _ col: Int, _ prev: Int) -> Int {
        if row < 0 || col < 0 {
            return 0
        }

        if row >= grid.count || col >= grid[0].count {
            return 0
        }

        let curr = grid[row][col]

        if curr <= prev {
            return 0
        }

        if dp[row][col] != noValue {
            return dp[row][col]
        }

        let top = traverse(row - 1, col, curr)
        let right = traverse(row, col + 1, curr)
        let down = traverse(row + 1, col, curr)
        let left = traverse(row, col - 1, curr)

        dp[row][col] = (1 + top + right + down + left) % mod

        return dp[row][col]
    }
}
