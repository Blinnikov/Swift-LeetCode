class Solution {
    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        var dp = Array(repeating: 1_000_000_000, count: cost.count + 1)
        dp[0] = 0

        for i in 0..<cost.count {
            for j in stride(from: cost.count, to: 0, by: -1) {
                dp[j] = min(dp[j], dp[max(j - time[i] - 1, 0)] + cost[i])
            }
        }

        return dp[cost.count]
    }
}
