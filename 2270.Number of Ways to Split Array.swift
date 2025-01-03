class Solution {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var ps = Array(repeating: 0, count: nums.count)
        ps[0] = nums[0]

        for i in 1..<nums.count {
            ps[i] = ps[i - 1] + nums[i]
        }

        var res = 0

        for i in 0..<(nums.count - 1) {
            if ps[i] >= ps[nums.count - 1] - ps[i] {
                res += 1
            }
        }

        return res
    }
}
