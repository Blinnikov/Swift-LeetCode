class Solution {
    func isPathCrossing(_ path: String) -> Bool {
        var path = Array(path)
        var set = Set<Point>()

        var current = Point(x: 0, y: 0)
        set.insert(current)

        for ch in path {
            var p: Point

            switch ch {
                case "N": p = Point(x: 0, y: 1)
                case "E": p = Point(x: 1, y: 0)
                case "W": p = Point(x: -1, y: 0)
                case "S": p = Point(x: 0, y: -1)
                default: p = Point(x: 0, y: 0)
            }

            current = Point(x: current.x + p.x, y: current.y + p.y)

            if set.contains(current) {
                return true
            }

            set.insert(current)
        }

        return false
    }

    struct Point: Hashable {
        var x: Int
        var y: Int
    }
}
