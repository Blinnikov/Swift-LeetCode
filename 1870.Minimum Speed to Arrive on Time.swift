class Solution {
    private let maxAns = 10_000_000
    private var dist = [Int]()

    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        if hour < Double(dist.count - 1) {
            return -1
        }

        self.dist = dist

        var lo = 1
        var hi = maxAns

        while lo <= hi {
            let mid = (lo + hi) / 2

            if isValid(mid, hour) {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }

        return lo > maxAns ? -1 : lo
    }

    private func isValid(_ speed: Int, _ hour: Double) -> Bool {
        var time = 0.0

        for i in 0..<dist.count {
            time = ceil(time)
            time += Double(dist[i]) / Double(speed)

            if time > hour {
                return false
            }
        }

        return true
    }
}
