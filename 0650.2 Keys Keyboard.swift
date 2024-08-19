class Solution {
    func minSteps(_ n: Int) -> Int {
        if n == 1 {
            return 0
        }
        
        var dp = Array(repeating: 1000, count: n + 1)
        dp[1] = 0

        for i in 2...n {
            for j in 1...(i / 2) {
                if i % j == 0 {
                    dp[i] = min(dp[i], dp[j] + i / j)
                }
            }
        }

        return dp[n]
    }
}
