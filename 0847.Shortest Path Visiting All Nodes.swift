class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        var queue = [Path]()
        var pathTracker = Set<Path>()

        for i in 0..<graph.count {
            let visitedMask = 1 << i

            pathTracker.insert(Path(node: i, length: 0, visited: visitedMask))
            queue.insert(Path(node: i, length: 1, visited: visitedMask), at: 0)
        }

        while !queue.isEmpty {
            let path = queue.removeLast()

            if path.visited == 1 << graph.count - 1 {
                return path.length - 1
            } else {
                let neighbours = graph[path.node]

                for nei in neighbours {
                    var visitedMask = path.visited | 1 << nei

                    var p = Path(node: nei, length: 0, visited: visitedMask)

                    if !pathTracker.contains(p) {
                        queue.insert(Path(node: nei, length: path.length + 1, visited: visitedMask), at: 0)
                        pathTracker.insert(p)
                    }
                }
            }
        }

        return -1
    }

    struct Path : Hashable {
        let node: Int
        let length: Int
        let visited: Int
    }
}
