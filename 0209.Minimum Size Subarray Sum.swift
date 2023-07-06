class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var lo = 0
        var hi = 0

        var sum = 0
        var res = Int.max

        while hi < nums.count {
            sum += nums[hi]
            hi += 1

            while sum >= target {
                res = min(res, hi - lo)
                
                sum -= nums[lo]
                lo += 1
            }
        }

        return res == Int.max ? 0 : res
    }
}
