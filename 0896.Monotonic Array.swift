class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }

        var isIncreasing = true

        for i in 1..<nums.count {
            if nums[i] < nums[i - 1] {
                isIncreasing = false
                break
            }
        }

        if isIncreasing {
            return true
        }

        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                return false
            }
        }

        return true
    }
}
