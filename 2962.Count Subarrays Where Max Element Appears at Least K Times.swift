class Solution {
    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var res = 0
        var count = 0
        var lo = 0
        var hi = 0

        let m = nums.max()!

        while hi < nums.count || lo > hi {
            if nums[hi] == m {
                count += 1
            }

            while count >= k {
                if nums[lo] == m {
                    count -= 1
                }

                lo += 1
                res += nums.count - hi
            }

            hi += 1
        }

        return res
    }
}
