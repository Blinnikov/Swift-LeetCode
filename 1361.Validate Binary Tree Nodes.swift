class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        var adj = [Int:[Int]]()
        var incomingNodes = Array(repeating: 0, count: n)

        for node in 0..<n {
            let left = leftChild[node]

            if left != -1 {
                adj[node, default: [Int]()].append(left)
                incomingNodes[left] += 1
            }

            let right = rightChild[node]

            if right != -1 {
                adj[node, default: [Int]()].append(right)
                incomingNodes[right] += 1
            }
        }

        var roots = [Int]()
        for node in 0..<n {
            if incomingNodes[node] == 0 {
                roots.append(node)
            }
        }

        if roots.count != 1 {
            return false
        }

        let root = roots[0]

        var queue = [Int]()
        queue.append(root)

        var seen = Set<Int>()
        seen.insert(root)

        while !queue.isEmpty {
            let node = queue.removeLast()

            if let children = adj[node] {
                for child in children {
                    if seen.contains(child) {
                        return false
                    }

                    seen.insert(child)
                    queue.insert(child, at: 0)
                }
            }
        }

        return seen.count == n
    }
}
