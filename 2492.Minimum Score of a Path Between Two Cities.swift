class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        var res = Int.max

        var adj = Array(repeating: [(Int, Int)](), count: n + 1)
        for r in roads {
            adj[r[0]].append((r[1], r[2]))
            adj[r[1]].append((r[0], r[2]))
        }

        var seen: Set<Int> = []
        var queue = [Int]()

        seen.insert(1)
        queue.append(1)

        while !queue.isEmpty {
            let n = queue.removeLast()
            for nei in adj[n] {
                res = min(res, nei.1)
                if !seen.contains(nei.0) {
                    seen.insert(nei.0)
                    queue.insert(nei.0, at: 0)
                }
            }
        }

        return res
    }
}
