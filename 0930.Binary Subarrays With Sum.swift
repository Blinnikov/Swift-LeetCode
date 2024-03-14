class Solution {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var ps = Array(repeating: 0, count: nums.count + 1)
        ps[0] = 1

        var res = 0
        var sum = 0

        for n in nums {
            sum += n

            if sum >= goal {
                res += ps[sum - goal]
            }

            ps[sum] += 1
        }

        return res
    }
}
