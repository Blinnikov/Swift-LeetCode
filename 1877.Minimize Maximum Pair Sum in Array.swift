class Solution {
    func minPairSum(_ nums: [Int]) -> Int {
        var nums = nums.sorted()

        var lo = 0
        var hi = nums.count - 1

        var res = 0

        while lo < hi {
            let sum = nums[lo] + nums[hi]
            res = max(res, sum)

            lo += 1
            hi -= 1
        }

        return res
    }
}
