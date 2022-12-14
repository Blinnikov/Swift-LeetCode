class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        let n = nums.count
        var dp = Array(repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = nums[1]
        
        for i in 2..<n {
            dp[i] = nums[i] + dp[i-2]
            dp[i-1] = max(dp[i-1],dp[i-2])
        }
        
        return max(dp[n-1], dp[n-2])
    }
}
