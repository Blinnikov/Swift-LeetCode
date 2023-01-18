class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var rightMax = Array(repeating: 0, count: nums.count)
        rightMax[nums.count - 1] = nums[nums.count - 1]

        var suffixSum = nums[nums.count - 1]
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            suffixSum += nums[i]
            rightMax[i] = max(rightMax[i + 1], suffixSum)
        }

        var maxSum = nums[0]
        var specialSum = nums[0]

        var prefixSum = 0
        var currentMax = 0
        for i in 0..<nums.count {
            currentMax = max(0, currentMax) + nums[i]
            maxSum = max(maxSum, currentMax)

            prefixSum += nums[i]

            if i + 1 < nums.count {
                specialSum = max(specialSum, prefixSum + rightMax[i + 1])
            }
        }

        return max(maxSum, specialSum)
    }
}
