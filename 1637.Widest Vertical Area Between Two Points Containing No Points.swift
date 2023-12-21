class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        let points = points.sorted { $0[0] < $1[0] }

        var res = 0

        for i in 1..<points.count {
            res = max(res, points[i][0] - points[i - 1][0])
        }

        return res
    }
}
