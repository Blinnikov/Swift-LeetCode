class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = [Int:[Int]]()
        var seen = Array(repeating: false, count: n)
        
        for e in edges {
            graph[e[0], default: [Int]()].append(e[1])
            graph[e[1], default: [Int]()].append(e[0])
        }
        
        return dfs(graph, &seen, source, destination)
    }

    private func dfs(_ graph: [Int:[Int]], _ seen: inout[Bool], _ curr: Int, _ dest: Int) -> Bool {
        if curr == dest {
            return true
        }

        if !seen[curr] {
            seen[curr] = true
            
            for next in graph[curr]! {
                if dfs(graph, &seen, next, dest) {
                    return true
                }
            }
        }

        return false
    }
}
