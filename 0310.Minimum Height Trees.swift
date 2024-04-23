class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n == 1 {
            return [0]
        }

        var branches = Array(repeating: 0, count: n)
        var adj = [Int:[Int]]()

        for e in edges {
            let l = e[0]
            let r = e[1]

            print(l, r)

            adj[l, default: []].append(r)
            adj[r, default: []].append(l)

            branches[l] += 1
            branches[r] += 1
        }

        var queue = [Int]()
        queue.reserveCapacity(n)

        for i in 0..<n {
            if branches[i] == 1 {
                queue.insert(i, at: 0)
            }
        }

        var nodes = n

        while nodes > 2 {
            var count = queue.count
            nodes -= count

            while count > 0 {
                let leaf = queue.removeLast()

                if adj[leaf] == nil {
                    count -= 1
                    continue
                }

                for next in adj[leaf]! {
                    branches[next] -= 1

                    if branches[next] == 1 {
                        queue.insert(next, at: 0)
                    }
                }

                adj[leaf] = nil

                count -= 1
            }
        }

        return queue
    }
}
