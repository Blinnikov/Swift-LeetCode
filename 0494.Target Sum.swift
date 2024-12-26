class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        let sum = nums.reduce(0, +)
        
        var dp = Array(repeating: Array(repeating: 0, count: 2 * sum + 1), count: nums.count)
        dp[0][nums[0] + sum] = 1
        dp[0][-nums[0] + sum] += 1

        for i in 1..<nums.count {
            for s in stride(from: -sum, through: sum, by: 1) {
                if dp[i - 1][s + sum] > 0 {
                    dp[i][s + nums[i] + sum] += dp[i - 1][s + sum]
                    dp[i][s - nums[i] + sum] += dp[i - 1][s + sum]
                }
            }
        }

        return abs(target) > sum ? 0 : dp[nums.count - 1][target + sum]
    }
}
