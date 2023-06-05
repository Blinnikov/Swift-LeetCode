class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        var coords = coordinates.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
        // print(coords)

        var angle = Double(coords[1][1] - coords[0][1]) / Double(coords[1][0] - coords[0][0])
        // print(angle)

        for i in 1..<coords.count {
            if Double(coords[i][1] - coords[i - 1][1]) / Double(coords[i][0] - coords[i - 1][0]) != angle {
                return false
            }
        }

        return true
    }
}
