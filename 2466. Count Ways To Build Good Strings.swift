class Solution {
    private let mod = 1_000_000_007

    func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
        var dp = Array(repeating: 0, count: high + 1)
        dp[0] = 1

        var res = 0

        for i in 1...high {
            if i >= zero {
                dp[i] = (dp[i] + dp[i - zero]) % mod
            }

            if i >= one {
                dp[i] = (dp[i] + dp[i - one]) % mod
            }

            if i >= low {
                res = (res + dp[i]) % mod
            }
        }

        return res
    }
}
