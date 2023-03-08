class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var lo = 1
        var hi = piles.max()!

        while lo <= hi {
            let mid = (lo + hi) / 2

            var hours = 0
            for pile in piles {
                hours += pile / mid
                if (pile % mid) != 0 {
                    hours += 1
                }
            }

            if hours <= h {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }

        return lo
    }
}
