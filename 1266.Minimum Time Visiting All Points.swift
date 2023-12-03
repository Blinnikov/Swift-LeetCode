class Solution {
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var res = 0

        for i in 0..<points.count - 1 {
            res += time(from: points[i], to: points[i + 1])
        }

        return res
    }

    private func time(from: [Int], to: [Int]) -> Int {
        max(
            abs(from[0] - to[0]),
            abs(from[1] - to[1])
        )
    }
}
