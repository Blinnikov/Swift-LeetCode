class Solution {
    func maxProductDifference(_ nums: [Int]) -> Int {
        let n = nums.count
        let nums = nums.sorted()

        return nums[n - 1] * nums[n - 2] - nums[0] * nums[1]
    }
}
