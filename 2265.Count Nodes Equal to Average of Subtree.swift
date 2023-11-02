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
    var result = 0

    func averageOfSubtree(_ root: TreeNode?) -> Int {
        traverse(root)
        return result
    }

    private func traverse(_ node: TreeNode?) -> (sum: Int, count: Int) {
        guard let node = node else {
            return (0, 0)
        }

        let left = traverse(node.left)
        let right = traverse(node.right)

        let sum = left.sum + right.sum + node.val
        let count = left.count + right.count + 1

        if sum / count == node.val {
            result += 1
        }

        return (sum, count)
    }
}
