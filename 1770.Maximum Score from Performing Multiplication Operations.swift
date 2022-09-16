class Solution {
    
    // For recurisve version
    private var multipliers = [Int]()
    private var memo = [[Int]]()
    
    var dp = [[Int]]()
    
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let n = nums.count, m = multipliers.count
        dp = Array(repeating: Array(repeating: 0, count: m+1), count: m+1)
        
        for step in stride(from: m-1, through: 0, by: -1) {
            for lo in stride(from: step, through: 0, by: -1) {
                dp[step][lo] = max(
                    nums[lo] * multipliers[step] + dp[step+1][lo+1],
                    nums[n-1-(step-lo)] * multipliers[step] + dp[step+1][lo]
                )
            }
        }
        
        return dp[0][0]
    }
    
    func maximumScore_revursive(_ nums: [Int], _ multipliers: [Int]) -> Int {
        self.multipliers = multipliers
        memo = Array(repeating: Array(repeating: Int.min, count: multipliers.count+1), count: nums.count+1)
        return recurse(nums, 0, 0)
    }
    
    private func recurse(_ nums: [Int], _ step: Int, _ lo: Int) -> Int {
        if step == multipliers.count {
            return 0
        }
        
        if memo[step][lo] != Int.min {
            return memo[step][lo]
        }
        
        let res = max(
            nums[lo] * multipliers[step] + recurse(nums, step+1, lo+1),
            nums[nums.count-1-(step-lo)] * multipliers[step] + recurse(nums, step+1, lo)
        )
        memo[step][lo] = res
        return res
    }
}
