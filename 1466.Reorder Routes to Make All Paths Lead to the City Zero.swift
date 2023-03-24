class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var adj = Array(repeating: [Int](), count: n)

        for conn in connections {
            let from = conn[0]
            let to = conn[1]
            
            adj[from].append(to)
            adj[to].append(-from)
        }

        var visited = Array(repeating: false, count: n)

        return dfs(0, adj, &visited)
    }

    private func dfs(_ origin: Int, _ adj: [[Int]], _ visited: inout [Bool]) -> Int {
        var res = 0

        visited[origin] = true

        for next in adj[origin] {
            if !visited[abs(next)] {
                let extra = next > 0 ? 1 : 0
                res += dfs(abs(next), adj, &visited) + extra
            }
        }

        return res
    }
}
