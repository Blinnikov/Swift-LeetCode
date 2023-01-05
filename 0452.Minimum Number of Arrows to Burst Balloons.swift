class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[1] < $1[1] }

        var count = 1
        var position = points[0][1]

        for i in 1..<points.count {
            if position >= points[i][0] {
                continue
            }

            count += 1
            position = points[i][1]
        }

        return count
    }
}
