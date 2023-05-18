class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var nodes = Array(repeating: 0, count: n)

        for e in edges {
            nodes[e[1]] = 1
        }

        var res = [Int]()

        for i in 0..<nodes.count {
            if nodes[i] == 0 {
                res.append(i)
            }
        }

        return res
    }
}
