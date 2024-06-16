class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var nextNum = 1
        var res = 0

        var idx = 0

        while nextNum <= n {
            if idx < nums.count, nums[idx] <= nextNum {
                nextNum += nums[idx]
                idx += 1
            } else {
                nextNum *= 2
                res += 1
            }
        }

        return res
    }
}
