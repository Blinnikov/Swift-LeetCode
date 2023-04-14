class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        var chars = Array(s)
        let n = chars.count

        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        for row in stride(from: n - 1, through: 0, by: -1) {
            dp[row][row] = 1

            for col in (row + 1)..<n {

                // print(row, col)

                if chars[row] == chars[col] {
                    dp[row][col] = dp[row + 1][col - 1] + 2
                } else {
                    dp[row][col] = max(dp[row + 1][col], dp[row][col - 1])
                }
            }
        }

        return dp[0][n-1]
    }
}
