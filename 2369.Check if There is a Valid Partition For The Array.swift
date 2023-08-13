class Solution {
    func validPartition(_ nums: [Int]) -> Bool {
        let n = nums.count

        var dp = Array(repeating: false, count: n)

        dp[1] = nums[0] == nums[1]

        if n == 2 {
            return dp[1]
        }

        dp[2] = (nums[0] == nums[1] && nums[1] == nums[2])
                ||
                (nums[0] + 1 == nums[1] && nums[1] + 1 == nums[2])

        if n == 3 {
            return dp[2]
        }

        for i in 3..<n {
            if nums[i] == nums[i - 1] {
                dp[i] = dp[i] || dp[i - 2]
            }

            if nums[i] == nums[i - 1], nums[i - 1] == nums[i - 2], dp[i - 3] {
                dp[i] = true
            }

            if nums[i] == nums[i - 1] + 1, nums[i - 1] == nums[i - 2] + 1, dp[i - 3] {
                dp[i] = true
            }
        }
        
        return dp[n - 1]
    }
}
