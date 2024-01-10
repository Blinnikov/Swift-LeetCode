/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    private var adj = [Int:[Int]]()

    func amountOfTime(_ root: TreeNode?, _ start: Int) -> Int {
        guard let root = root else {
            return 0
        }

        fillAdjacentMatrix(root)

        var queue = [Int]()
        queue.append(start)

        var visited = Set<Int>()

        var res = -1

        while !queue.isEmpty {
            res += 1

            var count = queue.count
            while count > 0 {
                let val = queue.removeLast()
                visited.insert(val)

                if let neighbours = adj[val] {
                    for n in neighbours {
                        if !visited.contains(n) {
                            queue.insert(n, at: 0)
                        }
                    }
                }

                count -= 1
            }
        }

        return res
    }

    private func fillAdjacentMatrix(_ node: TreeNode) {
        if let left = node.left {
            adj[node.val, default: [Int]()].append(left.val)
            adj[left.val, default: [Int]()].append(node.val)

            fillAdjacentMatrix(left)
        }

        if let right = node.right {
            adj[node.val, default: [Int]()].append(right.val)
            adj[right.val, default: [Int]()].append(node.val)

            fillAdjacentMatrix(right)
        }
    }
}
