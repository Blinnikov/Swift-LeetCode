class Solution {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        let n = nums.count

        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        for i in 0..<n {
            dp[i][i] = nums[i]
        }

        for size in 1..<n {
            for lo in 0..<(n - size) {
                let hi = lo + size
                dp[lo][hi] = max(
                    nums[lo] - dp[lo + 1][hi],
                    nums[hi] - dp[lo][hi - 1]
                )
            }
        }

        return dp[0][n - 1] >= 0
    }
}
