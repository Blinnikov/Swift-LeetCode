class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums

        return countSubarrays(&nums, k) - countSubarrays(&nums, k - 1)
    }

    func countSubarrays(_ nums: inout [Int], _ k: Int) -> Int {
        var lo = 0
        var hi = 0

        var res = 0
        var map = [Int:Int]()

        while hi < nums.count {
            map[nums[hi], default: 0] += 1

            while map.count > k {
                map[nums[lo], default: 0] -= 1

                if map[nums[lo], default: 0] == 0 {
                    map[nums[lo]] = nil
                }

                lo += 1
            }

            res += (hi - lo + 1)
            hi += 1
        }

        return res
    }
}
