class Solution {
    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var lo = 0
        var hi = 100_000_000_000_000 // 10^7 * 10^7

        while lo < hi {
            var mid = (lo + hi) / 2

            var sum = 0
            for t in time {
                sum += mid / t
            }

            if sum < totalTrips {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }
}
