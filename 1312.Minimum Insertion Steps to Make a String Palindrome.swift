class Solution {
    func minInsertions(_ s: String) -> Int {
        let len = s.count
        var chars = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: len + 1), count: len + 1)

        for i in 0..<len {
            for j in 0..<len {
                dp[i + 1][j + 1] = chars[i] == chars[len - 1 - j]
                    ? dp[i][j] + 1
                    : max(dp[i][j + 1], dp[i + 1][j])
            }
        }

        return len - dp[len][len]
    }
}
