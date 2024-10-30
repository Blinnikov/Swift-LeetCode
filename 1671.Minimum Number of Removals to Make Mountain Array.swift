class Solution {
    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        var left = Array(repeating: 1, count: nums.count)
        var right = Array(repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in stride(from: i - 1, through: 0, by: -1) {
                if nums[i] > nums[j] {
                    left[i] = max(left[i], left[j] + 1)
                }
            }
        }

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            for j in (i + 1)..<nums.count {
                if nums[i] > nums[j] {
                    right[i] = max(right[i], right[j] + 1)
                }
            }
        }

        var res = Int.max

        for i in 0..<nums.count {
            if left[i] > 1, right[i] > 1 {
                res = min(res, nums.count - left[i] - right[i] + 1)
            }
        }

        return res
    }
}
