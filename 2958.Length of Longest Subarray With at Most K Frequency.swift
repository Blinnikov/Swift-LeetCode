class Solution {
    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var map = [Int:Int]()
        var res = 0

        var lo = 0
        var hi = 0

        while hi < nums.count {
            let num = nums[hi]
            hi += 1

            map[num, default: 0] += 1

            while lo < hi, map[num]! > k {
                map[nums[lo], default: 0] -= 1
                lo += 1
            }

            res = max(res, hi - lo)
        }

        return res
    }
}
