class Solution {
    private var vals = [Int]()

    func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
        self.vals = nums.sorted()

        var res = 0

        for i in 0..<nums.count {
            let val = binarySearch(vals[i] + k * 2)

            res = max(res, val - i + 1)
        }

        return res
    }

    private func binarySearch(_ n: Int) -> Int {
        var res = 0

        var lo = 0
        var hi = vals.count - 1

        while lo <= hi {
            let mid = (lo + hi) / 2

            if vals[mid] <= n {
                res = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        return res
    }
}
