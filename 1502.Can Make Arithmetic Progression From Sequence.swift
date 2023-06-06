class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        var nums = arr.sorted()

        var diff = abs(nums[1] - nums[0])

        for i in 1..<nums.count {
            if abs(nums[i] - nums[i - 1]) != diff {
                return false
            }
        }

        return true
    }
}
