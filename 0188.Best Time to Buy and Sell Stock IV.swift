class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        
        if k == 0 {
            return 0
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: prices.count), count: k+1)
        
        for i in 1...k {
            var _max = dp[i-1][0] - prices[0]
            
            for j in 1..<prices.count {
                dp[i][j] = max(dp[i][j-1], prices[j] + _max)
                _max = max(_max, dp[i-1][j] - prices[j])
            }
        }
        
        return dp[k][prices.count-1]
    }
}
