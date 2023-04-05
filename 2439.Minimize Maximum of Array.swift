class Solution {
    func minimizeArrayValue(_ nums: [Int]) -> Int {
        var sum = 0
        var res = 0

        for i in 0..<nums.count {
            sum += nums[i]
            res = max(res, (sum + i) / (i + 1))
        }

        return res
    }
}
