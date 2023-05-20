class Solution {
    private var sides = [Int]()
    private var graph = [[Int]]()

    func isBipartite(_ graph: [[Int]]) -> Bool {
        self.graph = graph
        self.sides = Array(repeating: 0, count: graph.count)

        for i in 0..<graph.count {
            if sides[i] == 0, !dfs(i, 1) {
                return false
            }
        }

        return true
    }

    private func dfs(_ i: Int, _ side: Int) -> Bool {
        sides[i] = side

        for j in 0..<graph[i].count {
            let next = graph[i][j]
            
            if sides[next] == -side {
                continue
            }

            if sides[next] == side || !dfs(next, -side) {
                return false
            }

        }

        return true
    }
}
