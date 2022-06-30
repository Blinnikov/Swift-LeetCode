class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        let med = nums.count % 2 == 0 
            ? Int((Double(nums[nums.count/2] + nums[nums.count/2 - 1]) / 2.0).rounded(.up))
            : nums[nums.count/2]
        
        return nums.reduce(0, { $0 + abs($1 - med) })
    }
}
