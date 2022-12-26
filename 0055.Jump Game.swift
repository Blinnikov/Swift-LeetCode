class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var minIndexThatLeadsToFinish = nums.count - 1

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if i + nums[i] >= minIndexThatLeadsToFinish {
                minIndexThatLeadsToFinish = i
            }
        }

        return minIndexThatLeadsToFinish == 0
    }
}
