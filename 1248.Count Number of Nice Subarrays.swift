class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums

        for i in 0..<nums.count {
            nums[i] &= 1
        }

        var ps = Array(repeating: 0, count: nums.count + 1)
        ps[0] = 1

        var res = 0
        var sum = 0

        for n in nums {
            sum += n

            if sum >= k {
                res += ps[sum - k]
            }

            ps[sum] += 1
        }

        return res
    }
}
