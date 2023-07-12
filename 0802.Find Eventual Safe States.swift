class Solution {
    private let notSeen = 0
    private let safe = 1
    private let unsafe = 2

    private var state = [Int]()
    private var graph = [[Int]]()

    private var res = [Int]()

    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        self.graph = graph
        self.state = Array(repeating: notSeen, count: graph.count)

        for i in 0..<graph.count {
            if traverse(i) {
                res.append(i)
            }
        }

        return res
    }

    private func traverse(_ idx: Int) -> Bool {
        if state[idx] != notSeen {
            return state[idx] == safe
        }

        state[idx] = unsafe

        for next in graph[idx] {
            if !traverse(next) {
                return false
            }
        }

        state[idx] = safe

        return true
    }
}
