class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        if cost.count == 2 {
            return min(cost[0], cost[1])
        }
        
        var dp = Array(repeating: 1000, count: cost.count)
        dp[dp.count-1] = cost[cost.count-1]
        dp[dp.count-2] = cost[cost.count-2]
        
        for i in stride(from: cost.count-3, through: 0, by: -1) {
            dp[i] = cost[i] + min(dp[i+1], dp[i+2])
        }
        
        return min(dp[0], dp[1])
    }
}
