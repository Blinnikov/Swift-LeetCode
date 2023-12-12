class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        let nums = nums.sorted()

        return (nums[nums.count - 1] - 1) * (nums[nums.count - 2] - 1)
    }
}
