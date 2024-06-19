class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        var lo = 1
        var hi = 1000_000_000

        var res = -1

        while lo <= hi {
            let mid = (lo + hi) / 2

            var bouquets = 0
            var adjacent = 0

            for i in 0..<bloomDay.count {
                if bloomDay[i] <= mid {
                    adjacent += 1

                    if adjacent >= k {
                        bouquets += 1
                        adjacent = 0
                    }

                } else {
                    adjacent = 0
                }
            }

            if bouquets >= m {
                hi = mid - 1
                res = mid
            } else {
                lo = mid + 1
            }
        }

        return res
    }
}
