class Solution {
    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var incomingEges = Array(repeating: 0, count: n)

        for e in edges {
            incomingEges[e[1]] += 1
        }

        var count = 0
        var res = -1

        for i in 0..<incomingEges.count {
            if incomingEges[i] == 0 {
                count += 1
                res = i
            }
        }

        return count > 1 ? -1 : res
    }
}
