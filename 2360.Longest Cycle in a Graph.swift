class Solution {
    private var res = -1

    func longestCycle(_ edges: [Int]) -> Int {
        var visited = Array(repeating: false, count: edges.count)

        for i in 0..<edges.count {
            if visited[i] {
                continue
            }

            var map = [Int:Int]()
            map[i] = 1
            dfs(i, edges, &map, &visited)
        }

        return res    
    }

    private func dfs(_ node: Int, _ edges: [Int], _ map: inout [Int:Int], _ visited: inout [Bool]) {
        visited[node] = true
        let next = edges[node]

        if next == -1 {
            return
        }

        let distanceTillNow = map[node]!

        if !visited[next] {
            map[next] = distanceTillNow + 1
            dfs(next, edges, &map, &visited)
        } else if let existingDistanceForNextNode = map[next] {
            res = max(res, distanceTillNow - existingDistanceForNextNode + 1)
        }
    }
}
