class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var lo = 0
        var zeroCount = 1

        var res = 0

        for hi in 0..<nums.count {
            if nums[hi] == 0 {
                zeroCount -= 1
            }

            while zeroCount < 0 {
                if nums[lo] == 0 {
                    zeroCount += 1
                }

                lo += 1
            }

            res = max(res, hi - lo)
        }

        return res
    }
}
