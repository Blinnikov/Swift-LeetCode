class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if connections.count < n - 1 {
            return -1
        }
        
        var ids = Array(repeating: 0, count: n)
        for i in 0..<n {
            ids[i] = i
        }

        var components = n

        for conn in connections {
            let parent1 = parent(for: conn[0], in: ids)
            let parent2 = parent(for: conn[1], in: ids)

            if parent1 != parent2 {
                ids[parent1] = parent2
                components -= 1
            }
        }

        return components - 1
    }

    private func parent(for id: Int, in ids: [Int]) -> Int {
        var i = id

        while i != ids[i] {
            i = ids[i]
        }

        return i
    }
}
