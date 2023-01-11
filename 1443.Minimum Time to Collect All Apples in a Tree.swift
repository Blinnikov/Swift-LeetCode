class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var adj = [Int:Set<Int>]()
        for e in edges {
            let a = e[0], b = e[1]
            adj[a, default: []].insert(b)
            adj[b, default: []].insert(a)
        }

        return dfs(0, -1, adj, hasApple)
    }

    private func dfs(_ node: Int, _ parent: Int, _ adj: [Int:Set<Int>], _ hasApple: [Bool]) -> Int {
        guard let children = adj[node] else {
            return 0
        }

        var total = 0, subTreeTime = 0
        for ch in children {
            if ch == parent {
                continue
            }

            subTreeTime = dfs(ch, node, adj, hasApple)
            
            if subTreeTime > 0 || hasApple[ch] {
                total += subTreeTime + 2
            }
        }

        return total
    }
}
