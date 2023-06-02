class Solution {
    private var bombs = [[Int]]()

    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        self.bombs = bombs

        var res = 0

        for i in 0..<bombs.count {
            var visited = Array(repeating: false, count: bombs.count)
            var subRes = dfs(i, &visited)

            res = max(res, subRes)
        }

        return res
    }

    private func dfs(_ index: Int, _ visited: inout[Bool]) -> Int {
        var count = 1

        visited[index] = true

        for i in 0..<bombs.count {
            if !visited[i], canExplode(bombs[index], bombs[i]) {
                visited[i] = true
                count += dfs(i, &visited)
            }
        }

        return count
    }

    private func canExplode(_ bomb1: [Int], _ bomb2: [Int]) -> Bool {
        var dx = bomb1[0] - bomb2[0]
        var dy = bomb1[1] - bomb2[1]
        var r = bomb1[2]

        return dx * dx + dy * dy <= r * r
    }
}
