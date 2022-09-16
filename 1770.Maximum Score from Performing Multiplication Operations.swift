class Solution {
    
    private var multipliers = [Int]()
    private var memo = [[Int]]()
    
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
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
