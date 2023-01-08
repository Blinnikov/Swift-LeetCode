class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        if points.count == 1 {
            return 1
        }

        var result = 2

        for i in 0..<points.count {
            var map = [Double:Int]()

            for j in 0..<points.count {
                if j == i {
                    continue
                }

                let diffY = Double(points[j][1] - points[i][1])
                let diffX = Double(points[j][0] - points[i][0])
                let atan = atan2(diffY, diffX)
                map[atan] = map[atan, default: 0] + 1
            }

            result = max(result, map.values.max()! + 1)
        }

        return result 
    }
}
