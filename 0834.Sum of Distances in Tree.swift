class Solution {
    private var answer: [Int]
    private var count: [Int]
    private var graph: [Set<Int>]
    private var n: Int

    init() {
        answer = [Int]()
        count = [Int]()
        graph = [Set<Int>]()
        n = -1
    }

    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        self.n = n
        self.graph = Array(repeating: Set<Int>(), count: n)
        self.answer = Array(repeating: 0, count: n)
        self.count = Array(repeating: 1, count: n)

        for e in edges {
            graph[e[0]].insert(e[1])
            graph[e[1]].insert(e[0])
        }

        dfs(0, -1)
        dfs_preorder(0, -1)

        return answer
    }

    private func dfs(_ node: Int, _ parent: Int) {
        for child in graph[node] {
            if child != parent {
                dfs(child, node)
                count[node] += count[child]
                answer[node] += answer[child] + count[child]
            }
        }
    }

    private func dfs_preorder(_ node: Int, _ parent: Int) {
        for child in graph[node] {
            if child != parent {
                answer[child] = answer[node] - count[child] + n - count[child]
                dfs_preorder(child, node)
            }
        }
    }
}
