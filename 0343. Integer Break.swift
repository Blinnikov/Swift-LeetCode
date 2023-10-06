class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1

        for i in 2...n {
            for j in 1...(i / 2) {
                dp[i] = max(
                    dp[i],
                    max(j, dp[j]) * max(i - j, dp[i - j])
                )
            }
        }

        return dp[n]
    }
}
