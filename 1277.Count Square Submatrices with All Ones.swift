class Solution {
    private var matrix = [[Int]]()
    private var dp = [[Int]]()

    func countSquares(_ matrix: [[Int]]) -> Int {
        self.matrix = matrix
        dp = Array(repeating: Array(repeating: -1, count: matrix[0].count), count: matrix.count)

        var res = 0

        for r in 0..<matrix.count {
            for c in 0..<matrix[0].count {
                res += count(r, c)
            }
        }

        return res
    }

    private func count(_ row: Int, _ col: Int) -> Int {
        if row >= matrix.count || col >= matrix[0].count {
            return 0
        }

        if matrix[row][col] == 0 {
            return 0
        }

        if dp[row][col] != -1 {
            return dp[row][col]
        }

        let r = count(row, col + 1)
        let b = count(row + 1, col)
        let d = count(row + 1, col + 1)

        dp[row][col] = 1 + min(min(r, b), d)

        return dp[row][col]
    }
}
