class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var prod = 1
        
        var lo = 0
        var hi = 0

        while hi < nums.count {
            prod *= nums[hi]
            hi += 1

            while lo < hi, prod >= k {
                prod /= nums[lo]
                lo += 1
            }

            res += (hi - lo)
        }

        return res
    }
}
