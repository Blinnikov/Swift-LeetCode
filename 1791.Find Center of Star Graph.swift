class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        var adj = [Int:[Int]]()

        for e in edges {
            let from = e[0]
            let to = e[1]

            adj[from, default: [Int]()].append(to)

            if adj[from]!.count > 1 {
                return from
            }

            adj[to, default: [Int]()].append(from)

            if adj[to]!.count > 1 {
                return to
            }
        }

        return -1
    }
}
