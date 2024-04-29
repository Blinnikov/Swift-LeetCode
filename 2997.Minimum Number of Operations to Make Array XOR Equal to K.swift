class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var k = k
        var totalXor = 0

        for i in 0..<nums.count {
            totalXor ^= nums[i]
        }

        var res = 0

        while k > 0 || totalXor > 0 {
            if (k & 1) != (totalXor & 1) {
                res += 1
            }

            k >>= 1
            totalXor >>= 1
        }

        return res
    }
}
