class Solution {
    private var res = [[Int]]()

    func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        res = Array(repeating: [Int](), count: n)

        var adj = [Int: [Int]]()

        for e in edges {
            let from = e[0]
            let to = e[1]

            adj[from, default: [Int]()].append(to)
        }

        for i in 0..<n {
            var visited = Array(repeating: false, count: n)
            traverse(i, i, &adj, &visited)
        }

        for i in 0..<n {
            res[i].sort()
        }

        return res
    }

    private func traverse(_ parent: Int, _ current: Int, _ adj: inout [Int:[Int]], _ visited: inout [Bool]) {
        visited[current] = true

        for next in adj[current] ?? [] {
            if visited[next] {
                continue
            }

            res[next].append(parent)

            traverse(parent, next, &adj, &visited)
        }
    }
}
