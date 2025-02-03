class Solution {
    func longestMonotonicSubarray(_ nums: [Int]) -> Int {
        var inc = 1
        var dec = 1
        var res = 1

        for i in 0..<nums.count - 1 {
            if nums[i + 1] > nums[i] {
                inc += 1
                dec = 1
            } else if nums[i + 1] < nums[i] {
                inc = 1
                dec += 1
            } else {
                inc = 1
                dec = 1
            }

            res = max(res, max(inc, dec))
        }

        return res
    }
}
