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
    func sumNumbers(_ root: TreeNode?) -> Int {
        return sum(root, 0)
    }

    private func sum(_ node: TreeNode?, _ value: Int) -> Int {
        guard let node = node else {
            return 0
        }

        var valueSoFar = value * 10 + node.val

        if node.left == nil, node.right == nil {
            return valueSoFar
        }

        return sum(node.left, valueSoFar) + sum(node.right, valueSoFar)
    }
}
