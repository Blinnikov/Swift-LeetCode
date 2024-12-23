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
    func minimumOperations(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        var queue = [TreeNode]()
        queue.append(root)

        var res = 0

        while !queue.isEmpty {
            let count = queue.count
            var nodes = Array(repeating: 0, count: count)

            for i in 0..<count {
                let node = queue.removeLast()
                nodes[i] = node.val

                if node.left != nil {
                    queue.insert(node.left!, at: 0)
                }

                if node.right != nil {
                    queue.insert(node.right!, at: 0)
                }
            }

            res += minSwapsCount(&nodes)
        }

        return res
    }

    private func minSwapsCount(_ nodes: inout [Int]) -> Int {
        var sortedNodes = nodes.sorted()

        var map = [Int:Int]()

        for i in 0..<nodes.count {
            map[nodes[i]] = i
        }

        var res = 0

        for i in 0..<nodes.count {
            if nodes[i] == sortedNodes[i] {
                continue
            }

            res += 1

            let nonSortedPosition = map[sortedNodes[i]]!
            map[nodes[i]] = nonSortedPosition
            nodes[nonSortedPosition] = nodes[i]
        }

        return res
    }
}
