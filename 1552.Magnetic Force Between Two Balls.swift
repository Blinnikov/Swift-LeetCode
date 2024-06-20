class Solution {
    private var p = [Int]()

    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        p = position.sorted()
        var lo = 1
        var hi = (p.last! - p.first!) / (m - 1)

        var res = 1

        while lo <= hi {
            let mid = (lo + hi) / 2

            if canFit(mid, m) {
                res = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }

        return res
    }

    private func canFit(_ force: Int, _ m: Int) -> Bool {
        var count = 1
        var prev = p[0]

        for i in 0..<p.count {
            if p[i] - prev >= force {
                prev = p[i]
                count += 1
            }

            if count >= m {
                return true
            }
        }

        return false
    }
}
