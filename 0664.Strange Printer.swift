class Solution {
    func strangePrinter(_ s: String) -> Int {
        let n = s.count

        if n == 1 {
            return 1
        }

        let chars = Array(s)

        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        for i in 0..<n {
            dp[i][i] = 1

            if i < n - 1 {
                dp[i][i + 1] = chars[i] == chars[i + 1] ? 1 : 2
            }
        }

        for size in 2..<n {
            for lo in 0..<(n - size) {
                dp[lo][lo + size] = size + 1

                for i in 0..<size {
                    let val = dp[lo][lo + i] + dp[lo + i + 1][lo + size]

                    dp[lo][lo + size] = min(
                        dp[lo][lo + size],
                        chars[lo + i] == chars[lo + size] ? val - 1 : val
                    )
                }
            }
        }

        return dp[0][n - 1]
    }
}
