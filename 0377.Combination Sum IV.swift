class Solution {
    private var dp = [Int]()
    
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        dp = Array(repeating: -1, count: target + 1)
        dp[0] = 1
        
        recurse(nums, target)
        return dp[target]
    }
    
    private func recurse(_ nums: [Int], _ target:Int) -> Int {
        if dp[target] > -1 {
            return dp[target]
        }
        
        var res = 0
        for num in nums {
            if num <= target {
                res += recurse(nums, target - num)
            }
        }
        
        dp[target] = res
        
        return res
    }
    
    // TLE
    func combinationSum4_1(_ nums: [Int], _ target: Int) -> Int {
        if target == 0 {
            return 1
        }
        
        var res = 0
        for num in nums {
            if num <= target {
                res += combinationSum4(nums, target - num)
            }
        }
        
        return res
    }
}
