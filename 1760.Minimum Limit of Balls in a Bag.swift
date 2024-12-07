class Solution {
    private var nums = [Int]()
    private var ops = 0

    func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
        self.nums = nums
        self.ops = maxOperations

        var lo = 0
        var hi = nums.max()!

        while lo < hi {
            let mid = (lo + hi) / 2

            if isApplicable(mid) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }

        return lo

        return 0
    }

    private func isApplicable(_ balls: Int) -> Bool {
        if balls == 0 {
            return false
        }

        var res = 0

        for n in nums {
            res += Int(ceil(Double(n) / Double(balls))) - 1

            if res > ops {
                return false
            }
        }

        return true
    }
}
