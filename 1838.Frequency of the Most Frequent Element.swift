class Solution {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()

        var res = 0
        var sum = 0

        var lo = 0
        var hi = 0

        while hi < nums.count {
            sum += nums[hi]

            while (k + sum) < (nums[hi] * (hi - lo + 1)) {
                sum -= nums[lo]
                lo += 1
            }

            res = max(res, hi - lo + 1)

            hi += 1
        }

        return res
    }
}
