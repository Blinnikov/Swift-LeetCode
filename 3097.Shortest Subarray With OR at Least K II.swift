class Solution {
    private var bits = Array(repeating: 0, count: 32)

    func minimumSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var res = Int.max

        var lo = 0
        var hi = 0

        while hi < nums.count {
            setBits(nums[hi], 1)

            while lo <= hi, bitsToNum() >= k {
                res = min(res, hi - lo + 1)

                setBits(nums[lo], -1)
                lo += 1
            }

            hi += 1
        }

        return res == Int.max ? -1 : res
    }

    private func bitsToNum() -> Int {
        var res = 0

        for i in 0..<32 {
            if bits[i] != 0 {
                res |= 1 << i
            }
        }

        return res
    }

    private func setBits(_ n: Int, _ inc: Int) {
        for i in 0..<32 {
            if (n >> i) & 1 != 0 {
                bits[i] += inc
            }
        }
    }
}
