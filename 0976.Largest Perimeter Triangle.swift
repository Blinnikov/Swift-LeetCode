class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        
        for i in stride(from: nums.count - 1, through: 2, by: -1) {
            if nums[i] < nums[i-1] + nums[i-2] {
                return nums[i-2] + nums[i-1] + nums[i]
            }
        }
        
        return 0
    }
}
