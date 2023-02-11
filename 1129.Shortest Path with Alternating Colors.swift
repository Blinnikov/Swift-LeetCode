class Solution {
    private let undefined = -1
    private let red = 0
    private let blu = 1

    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var adj: [Int:[(node: Int, color: Int)]] = [:]

        for r in redEdges {
            let fromNode = r[0]
            let toNode = r[1]
            adj[fromNode, default: [(Int,Int)]()].append((toNode, red))
        }

        for b in blueEdges {
            let fromNode = b[0]
            let toNode = b[1]
            adj[fromNode, default: [(Int,Int)]()].append((toNode, blu))
        }

        var result = Array(repeating: -1, count: n)
        result[0] = 0

        var visited = Array(repeating: Array(repeating: false, count: 2), count: n)
        visited[0][red] = true
        visited[0][blu] = true
        
        var queue: [(node: Int, steps: Int, prevNodeColor: Int)] = []
        queue.append((node: 0, steps: 0, prevNodeColor: undefined))

        while !queue.isEmpty {
            let item = queue.removeLast()

            if let neighbours = adj[item.node] {
                for n in neighbours {
                    if !visited[n.node][n.color] && n.color != item.prevNodeColor {
                        if result[n.node] == -1 {
                            result[n.node] = 1 + item.steps
                        }
                        visited[n.node][n.color] = true
                        queue.insert((n.node, 1 + item.steps, n.color), at:0)
                    }
                }
            } else {
                continue
            }
        }

        return result
    }
}
