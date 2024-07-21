class Solution {
    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        var rows = topologicalSort(rowConditions, k)
        var cols = topologicalSort(colConditions, k)

        if rows.isEmpty || cols.isEmpty {
            return []
        }

        var res = Array(repeating: Array(repeating: 0, count: k), count: k)

        for i in 0..<k {
            let r = rows.firstIndex(of: i + 1)
            let c = cols.firstIndex(of: i + 1)

            if r == nil || c == nil {
                continue
            }

            res[r! - 1][c! - 1] = i + 1
        }

        return res
    }

    private func topologicalSort(_ edges: [[Int]], _ n: Int) -> [Int] {
        var adj = [Int:[Int]]()
        var res = Array(repeating: 0, count: n + 1)
        var incomingDegree = Array(repeating: 0, count: n + 1)

        for e in edges {
            let from = e[0]
            let to = e[1]

            adj[from, default: [Int]()].append(to)
            incomingDegree[to] += 1
        }

        var queue = [Int]()

        for i in 1...n {
            if incomingDegree[i] == 0 {
                queue.insert(i, at: 0)
            }
        }

        var idx = 1

        while !queue.isEmpty {
            let node = queue.removeLast()
            
            res[idx] = node
            idx += 1

            let neighbors = adj[node]
            
            if neighbors == nil || neighbors!.isEmpty {
                continue
            }

            for next in neighbors! {
                incomingDegree[next] -= 1

                if incomingDegree[next] == 0 {
                    queue.insert(next, at: 0)
                }
            }
        }

        if idx != n + 1 {
            return []
        }

        return res
    }
}
