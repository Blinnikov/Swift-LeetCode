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
    func longestZigZag(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        if root.left == nil, root.right == nil {
            return 0
        }

        return max(
            traverse(root.left, true, 1),
            traverse(root.right, false, 1)
        )
    }

    private func traverse(_ node: TreeNode?, _ isLeft: Bool, _ length: Int) -> Int {
        if node == nil {
            return length
        }

        if isLeft, node!.right == nil {
            return max(length, traverse(node!.left, true, 1))
        }

        if !isLeft, node!.left == nil {
            return max(length, traverse(node!.right, false, 1))
        }

        return max(
            traverse(node!.right, false, isLeft ? length + 1 : 1), 
            traverse(node!.left, true, isLeft ? 1 : length + 1)
            )
    }
}
