class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var total = 0
        var _max = 0

        for w in weights {
            total += w
            _max = max(_max, w)
        }

        var lo = _max
        var hi = total

        while lo < hi {
            let mid = (lo + hi) / 2
            if canInclude(weights, days, mid) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }

        return lo
    }

    private func canInclude(_ weights: [Int], _ days: Int, _ current: Int) -> Bool {
        var required = 1
        var load = 0

        for w in weights {
            load += w
            if load > current {
                required += 1
                load = w
            }
        }

        return required <= days
    }
}
