class Solution {
    func isArraySpecial(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }

        for i in 0..<nums.count - 1 {
            if nums[i] & 1 == 1, nums[i + 1] & 1 == 1 {
                return false
            }

            if nums[i] & 1 == 0, nums[i + 1] & 1 == 0 {
                return false
            }
        }

        return true
    }
}
