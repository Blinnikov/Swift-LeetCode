class Solution {
    private var edges = [Int]()

    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        self.edges = edges
        let d1 = distances(from: node1)
        let d2 = distances(from: node2)

        var result = -1
        var minimumDistance = Int.max

        for i in 0..<edges.count {
            let candidate = max(d1[i], d2[i])
            if minimumDistance > candidate {
                result = i
                minimumDistance = candidate
            }
        }

        return result
    }

    private func distances(from node: Int) -> [Int] {
        let n = edges.count
        var distances = Array(repeating: Int.max, count: n)
        var visited = Array(repeating: false, count: n)

        distances[node] = 0

        var queue = [Int]()
        queue.append(node)

        var prev = node
        while !queue.isEmpty {
            let curr = queue.removeLast()
            if visited[curr] {
                continue
            }

            visited[curr] = true
            distances[curr] = distances[prev] + 1
            prev = curr
            let next = edges[curr]
            if next != -1 {
                queue.insert(next, at: 0)
            }
        }

        return distances
    }
}
