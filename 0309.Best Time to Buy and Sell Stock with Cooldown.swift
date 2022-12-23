class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: prices.count), count: 3)
        dp[0][0] = 0            // buy
        dp[1][0] = -prices[0]   // sell 
        dp[2][0] = 0            // cooldown

        var minBuy = dp[1][0]
        for i in 1..<prices.count {
            dp[0][i] = minBuy + prices[i]
            dp[1][i] = dp[2][i - 1] - prices[i]
            dp[2][i] = max(dp[2][i - 1], dp[0][i - 1])
            minBuy = max(minBuy, dp[1][i])
        }

        return max(dp[0][prices.count - 1], dp[2][prices.count - 1])
    }
}
