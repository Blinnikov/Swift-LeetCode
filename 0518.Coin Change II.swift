class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1

        for i in 0..<coins.count {
            for j in 1..<(amount + 1) {
                if j - coins[i] >= 0 {
                    dp[j] = dp[j] + dp[j - coins[i]]
                }
            }
        }

        return dp[amount]
    }
}
