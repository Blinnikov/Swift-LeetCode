class Solution {
    func jump(_ nums: [Int]) -> Int {

        var jumps = 0
        var segmentRightmostIndex = 0
        var maxReachableIndex = 0

        for i in 0..<nums.count - 1 {
            maxReachableIndex = max(maxReachableIndex, i + nums[i])

            if i == segmentRightmostIndex {
                jumps += 1
                segmentRightmostIndex = maxReachableIndex
            }
        }

        return jumps
    }
}
